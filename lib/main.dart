// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_config.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_connection_cubit.dart';
import 'package:mqtt_client_ui/features/pubsub/subscription_cubit.dart';
import 'package:mqtt_client_ui/features/theme/theme_mode_cubit.dart';
import 'package:mqtt_client_ui/ui/screens/connection_config_screen.dart';
import 'package:mqtt_client_ui/ui/widgets/connect_button.dart';
import 'package:mqtt_client_ui/ui/widgets/connection_config.dart';
import 'package:mqtt_client_ui/ui/widgets/connection_status.dart';
import 'package:mqtt_client_ui/ui/widgets/subscribe_topic_form.dart';
import 'package:mqtt_client_ui/ui/widgets/subscribed_topic.dart';

void main() {
  runApp(Providers());
}

class Providers extends StatelessWidget {
  final themeCubit = ThemeModeCubit();
  final pubsubCubit = PubsubClientConnectionCubit(
    SubscriptionCubit(),
  );
  Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: themeCubit,
        ),
        BlocProvider.value(
          value: pubsubCubit,
        ),
        BlocProvider.value(
          value: pubsubCubit.subscriptionCubit,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeCubit, ThemeMode>(
      builder: (context, themeModeState) {
        return MaterialApp(
          title: 'MQTT Client',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: themeModeState,
          home: const MyHomePage(
            title: 'MQTT Client',
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final isDarkModeEnabled =
        context.read<ThemeModeCubit>().isDarkModeEnabled(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Switch.adaptive(
            value: isDarkModeEnabled,
            onChanged: (value) {
              context.read<ThemeModeCubit>().switchMode(
                    isDarkModeEnabled ? ThemeMode.light : ThemeMode.dark,
                  );
            },
            thumbIcon: MaterialStatePropertyAll(
              Icon(
                isDarkModeEnabled ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<PubsubClientConnectionCubit,
          PubsubClientConnectionState>(
        listener: (context, pubsubClientState) {
          return connectionStateListener(
            pubsubClientState,
          );
        },
        builder: (context, pubsubClientState) {
          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        right: 32,
                        bottom: 16,
                        top: 32,
                      ),
                      child: ConnectionStatus(
                        pubsubClientConnectionState: pubsubClientState,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        right: 32,
                        bottom: 16,
                      ),
                      child: ConnectionConfigInfo(
                        config: pubsubClientState.config,
                        onTapConfig: () {
                          onTapConfig(
                            pubsubClientState,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                        right: 32,
                        bottom: 16,
                      ),
                      child: ConnectButton(
                        isConnected: pubsubClientState.maybeMap<bool>(
                          connected: (value) => true,
                          orElse: () => false,
                        ),
                        onConnectDisconnect:
                            onConnectDisconnect(pubsubClientState),
                      ),
                    ),
                    pubsubClientState.maybeMap<Widget>(
                      orElse: () => const SizedBox(),
                      connected: (value) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 32,
                            right: 32,
                            bottom: 16,
                          ),
                          child: SubscribeTopicForm(
                            onAddTopic: onAddTopic,
                          ),
                        );
                      },
                    ),
                    pubsubClientState.maybeMap<Widget>(
                      orElse: () => const SizedBox(),
                      connected: (value) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                              bottom: 16,
                            ),
                            child: BlocBuilder<SubscriptionCubit,
                                SubscriptionState>(
                              builder: (context, subscriptionState) {
                                return SubscribedTopic(
                                  subscriptionState: subscriptionState,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  void connectionStateListener(PubsubClientConnectionState state) {
    return state.maybeMap<void>(
      orElse: () {
        return;
      },
      error: (value) {
        showSnackbarMessage(
          value.error,
        );
        return;
      },
    );
  }

  void Function()? onConnectDisconnect(
    PubsubClientConnectionState pubsubClientConnectionState,
  ) {
    return pubsubClientConnectionState.maybeMap(
      orElse: () => null,
      connecting: (value) => null,
      prepared: (value) {
        return connect;
      },
      connected: (value) {
        return disconnect;
      },
      disconnected: (value) {
        return connect;
      },
      error: (value) {
        return connect;
      },
    );
  }

  void connect() {
    context.read<PubsubClientConnectionCubit>().connect(context);
    return;
  }

  void disconnect() {
    context.read<PubsubClientConnectionCubit>().disconnect();
    return;
  }

  Future<void> onTapConfig(PubsubClientConnectionState state) async {
    return state.maybeMap<Future<void>>(
      orElse: () async {
        showSnackbarMessage(
          'While being connected, connection configuration cannot be changed',
        );
        return;
      },
      disconnected: (value) {
        return navigateToClientConfigScreen(
          value.config,
        );
      },
      prepared: (value) {
        return navigateToClientConfigScreen(
          value.config,
        );
      },
      error: (value) {
        return navigateToClientConfigScreen(
          value.config,
        );
      },
    );
  }

  Future<void> navigateToClientConfigScreen(PubsubClientConfig? config) async {
    final configResult = await Navigator.push<PubsubClientConfig>(
      context,
      MaterialPageRoute(
        builder: (_) => ConnectionConfigScreen(
          initialConfig: config,
        ),
      ),
    );
    if (configResult == null) return;
    context.read<PubsubClientConnectionCubit>().setupConfig(configResult);
  }

  void onAddTopic(String topic) {
    context.read<PubsubClientConnectionCubit>().subscribeToTopic(
          topic: topic,
          context: context,
        );
    return;
  }

  void showSnackbarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    return;
  }
}
