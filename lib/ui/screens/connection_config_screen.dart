import 'package:flutter/material.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_config.dart';
import 'package:mqtt_client_ui/ui/widgets/connection_config_form.dart';

class ConnectionConfigScreen extends StatefulWidget {
  final PubsubClientConfig? initialConfig;
  const ConnectionConfigScreen({
    super.key,
    this.initialConfig,
  });

  @override
  State<ConnectionConfigScreen> createState() => _ConnectionConfigScreenState();
}

class _ConnectionConfigScreenState extends State<ConnectionConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Config',
        ),
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 16,
                top: 16,
              ),
              child: ConnectionConfigForm(
                initialConfig: widget.initialConfig,
                onSave: onSave,
                onCancel: onCancel,
              ),
            );
          },
        ),
      ),
    );
  }

  void onCancel() {
    Navigator.pop(
      context,
    );
    return;
  }

  void onSave(PubsubClientConfig? config) {
    if (config == null) {
      return;
    }
    Navigator.pop(
      context,
      config,
    );
    return;
  }
}
