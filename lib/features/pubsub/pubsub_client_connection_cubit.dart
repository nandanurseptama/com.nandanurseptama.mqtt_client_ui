import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>? _subscription;

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

    // final connMess = MqttConnectMessage()
    //     .authenticateAs(config.username, config.password);
    // client!.connectionMessage = connMess;

    emit(
      PubsubClientConnectionState.connecting(
        config,
      ),
    );
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
      _onException(
        config: config,
        error: 'Failed to connect to MQTT Server. Reason : ${error.toString()}',
      );
      return;
    }
  }

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
      //  if (c.isNotEmpty) {
      //     final p = c.first.payload as MqttPublishMessage;
      //     final pt =
      //         MqttPublishPayload.bytesToStringAsString(p.payload.message);
      //     p.header;

      //     print(
      //         'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      //     print('');
      //   }
    });
    emit(
      PubsubClientConnectionState.connected(
        state.config!,
      ),
    );
    return;
  }

  void disconnect() {
    if (client == null) return;
    client!.disconnect();
  }

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

  void _showSnackbarMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    return;
  }
}
