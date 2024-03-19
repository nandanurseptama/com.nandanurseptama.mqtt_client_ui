import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_config.dart';
import 'package:mqtt_client_ui/features/pubsub/subscription_cubit.dart';

part 'pubsub_client_connection_cubit.freezed.dart';

@freezed
class PubsubClientConnectionState with _$PubsubClientConnectionState {
  /// Connection configuration already prepared
  const factory PubsubClientConnectionState.prepared(
    PubsubClientConfig config,
  ) = _Prepared;

  /// Connected to pubsub service
  const factory PubsubClientConnectionState.connected(
    PubsubClientConfig config,
  ) = _Connected;

  /// Trying to connect to pubsub service
  const factory PubsubClientConnectionState.connecting(
    PubsubClientConfig config,
  ) = _Connecting;

  /// Trying to reconnecting to pubsub service
  const factory PubsubClientConnectionState.reconnecting(
    PubsubClientConfig config,
  ) = _Reconnecting;

  /// Disconnected from pubsub service
  const factory PubsubClientConnectionState.disconnected({
    @Default(null) PubsubClientConfig? config,
  }) = _Disconnected;

  /// Error when trying to connect
  ///
  /// or
  ///
  /// Any error occured when connected to pubsub service that make
  /// disconnected from pubsub service
  /// Disconnected from pubsub service
  const factory PubsubClientConnectionState.error({
    @Default(null) PubsubClientConfig? config,
    required String error,
  }) = _Error;
}

class PubsubClientConnectionCubit extends Cubit<PubsubClientConnectionState> {
  final SubscriptionCubit _subscriptionCubit;
  PubsubClientConnectionCubit(SubscriptionCubit subscriptionCubit)
      : _subscriptionCubit = subscriptionCubit,
        super(
          const PubsubClientConnectionState.disconnected(),
        );
  SubscriptionCubit get subscriptionCubit => _subscriptionCubit;

  MqttServerClient? client;

  // subscription for received message
  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>? _subscription;

  /// Setup configuration for MQTT
  void setupConfig(PubsubClientConfig config) {
    return state.maybeMap<void>(
      orElse: () {
        return;
      },
      prepared: (value) {
        emit(
          PubsubClientConnectionState.prepared(
            config,
          ),
        );
        return;
      },
      disconnected: (value) {
        emit(
          PubsubClientConnectionState.prepared(
            config,
          ),
        );
        return;
      },
      error: (value) {
        emit(
          PubsubClientConnectionState.prepared(
            config,
          ),
        );
        return;
      },
    );
  }

  /// Connect to MQTT Server
  ///
  /// with setuped connection config
  Future<void> connect(BuildContext context) async {
    final config = state.maybeMap<PubsubClientConfig?>(
      orElse: () => null,
      connected: (value) {
        return value.config;
      },
      connecting: (value) {
        return value.config;
      },
      disconnected: (value) {
        return value.config;
      },
      error: (value) {
        return value.config;
      },
      prepared: (value) {
        return value.config;
      },
    );

    // when configuration null
    //
    // Show error message to notify user
    if (config == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Connection configuration not set',
        ),
      ));
      return;
    }
    client = MqttServerClient.withPort(
      config.host,
      '',
      config.port,
    );

    client!.logging(on: true);
    client!.onConnected = _onConnected;
    client!.onDisconnected = _onDisconnected;
    client!.keepAlivePeriod = 20;

    // auto reconnect function
    //
    // when auto reconnect is true
    //
    // any disconnected error will be auto reconnect
    //
    // until client disconnect from the server
    client!.autoReconnect = true;

    // On auto reconnect
    client!.onAutoReconnect = _onAutoReconnect;

    emit(
      PubsubClientConnectionState.connecting(
        config,
      ),
    );
    _connectToMqtt(config);
  }

  Future<void> _connectToMqtt(PubsubClientConfig config) async {
    try {
      await client!.connect(
        config.username,
        config.password,
      );
    } on SocketException catch (e) {
      _onException(
        config: config,
        error: 'Failed to connect to MQTT Server. Reason : ${e.message}',
      );
      return;
    } catch (error) {
      debugPrint(error.toString());
      if (error.toString().toLowerCase().contains('badusernameorpassword')) {
        _onException(
          config: config,
          error:
              'Failed to connect to MQTT Server. Reason : username or password wrong',
        );
        return;
      }
      _onException(
        config: config,
        error: 'Failed to connect to MQTT Server. Reason : ${error.toString()}',
      );
      return;
    }
  }

  /// internal exception handler
  void _onException({
    required PubsubClientConfig config,
    required String error,
  }) {
    emit(
      PubsubClientConnectionState.error(
        error: error,
        config: config,
      ),
    );
    client!.disconnect();
    client = null;
    return;
  }

  /// internal on disconnected handler
  ///
  /// This function will be called
  ///
  /// either client disconnect from server
  /// or server going down
  void _onDisconnected() {
    debugPrint('_onDisconnected');
    emit(
      PubsubClientConnectionState.disconnected(
        config: state.config,
      ),
    );
    _subscription?.cancel();
    _subscription = null;
    client = null;
    _subscriptionCubit.clear();
    return;
  }

  /// Internal on auto reconnect handler
  ///
  /// This function will be called when client disconnected from server
  /// because no connection or any error connection occured from client
  ///
  /// or server disconnect from client
  ///
  /// On Auto reconnect will not be invoked
  /// When client call disconnect manually
  void _onAutoReconnect() {
    debugPrint('_onAutoReconnect');
    state.maybeMap<void>(
      orElse: () {
        return;
      },
      // when reconnecting happen, subscription to message queue must be cancel
      // to make sure there are no multiple subscription
      reconnecting: (value) {
        _subscription?.cancel();
        _subscription = null;
        return;
      },
      connected: (value) {
        emit(
          PubsubClientConnectionState.reconnecting(
            value.config,
          ),
        );
        return;
      },
      error: (value) {
        client?.disconnect();
        return;
      },
      connecting: (value) {
        return;
      },
      disconnected: (value) {
        if (value.config == null) {
          return;
        }
        client?.disconnect();
        return;
      },
    );
    return;
  }

  /// internal on connected handler
  ///
  /// subscribe message if connected to MQTT
  void _onConnected() {
    _subscription = client!.updates!.listen(
      (c) {},
    );
    _subscription?.onData((c) {
      if (c.isEmpty) {
        return;
      }
      final data = c.first;
      final message = c.first.payload as MqttPublishMessage;
      _subscriptionCubit.onUpdatesTopic(
        data.topic,
        message,
      );
    });
    emit(
      PubsubClientConnectionState.connected(
        state.config!,
      ),
    );
    return;
  }

  /// Disconnect handler when user want to disconnect
  /// from mqtt
  void disconnect() {
    if (client == null) return;
    client!.disconnect();
  }

  /// Subscribe topic handler when user want to subscribe [topic]
  /// from mqtt
  void subscribeToTopic({
    required String topic,
    required BuildContext context,
  }) {
    return state.maybeMap<void>(
      orElse: () {
        _showSnackbarMessage(
          context,
          'Not connected to MQTT Server',
        );
        return;
      },
      connected: (value) {
        _subscribeToTopic(
          context: context,
          topic: topic,
        );
        return;
      },
    );
  }

  /// Internal subscribe handler
  ///
  /// When success subscribe topic to mqtt
  /// add to subscription state
  void _subscribeToTopic({
    required String topic,
    required BuildContext context,
  }) async {
    final isTopicSubscribed = _subscriptionCubit.isTopicSubscribed(topic);
    if (isTopicSubscribed) {
      _showSnackbarMessage(context, 'Topic already subscribed');
      return;
    }
    try {
      final subscribtion = client!.subscribe(
        topic,
        MqttQos.atLeastOnce,
      );
      if (subscribtion == null) {
        _showSnackbarMessage(context, 'Failed subscribe topic');
        return;
      }
      _subscriptionCubit.addSubscription(
        topic,
      );
    } on ConnectionException catch (e) {
      _showSnackbarMessage(
          context, 'Failed subscribe topic. Reason : ${e.toString()}');
      return;
    } catch (error) {
      _showSnackbarMessage(
          context, 'Failed subscribe topic. Reason : ${error.toString()}');
      return;
    }
  }

  /// internal handling to show message
  void _showSnackbarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    return;
  }
}
