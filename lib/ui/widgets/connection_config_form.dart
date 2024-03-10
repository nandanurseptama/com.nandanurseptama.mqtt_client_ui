import 'package:flutter/material.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_config.dart';

/// Connection configuration form
class ConnectionConfigForm extends StatefulWidget {
  final PubsubClientConfig? initialConfig;
  /// Function callback when save button  pressed/tapped
  ///
  /// [PubsubClientConfig] value maybe null when form is not valid
  final void Function(PubsubClientConfig? config)? onSave;

  /// Function callback when  cancel button pressed/tapped
  final void Function()? onCancel;
  const ConnectionConfigForm({
    super.key,
    this.onCancel,
    this.onSave,
    this.initialConfig,
  });

  @override
  State<ConnectionConfigForm> createState() => _ConnectionConfigFormState();
}

class _ConnectionConfigFormState extends State<ConnectionConfigForm> {
  final TextEditingController _hostController = TextEditingController(),
      _portController = TextEditingController(),
      _usernameController = TextEditingController(),
      _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initController();
    super.initState();
  }

  void initController(){
    if(widget.initialConfig == null) return;
    _hostController.text = widget.initialConfig!.host;
    _portController.text = widget.initialConfig!.port.toString();
    _usernameController.text = widget.initialConfig!.username;
    _passwordController.text = widget.initialConfig!.password;
  }

  @override
  void dispose() {
    _hostController.clear();
    _portController.clear();
    _usernameController.clear();
    _passwordController.clear();

    _hostController.dispose();
    _portController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Host',
                      ),
                      validator: requiredValidator(
                        fieldName: 'Host',
                      ),
                      controller: _hostController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Port',
                      ),
                      keyboardType: TextInputType.number,
                      validator: requiredValidator(
                        fieldName: 'Port',
                      ),
                      controller: _portController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: requiredValidator(
                        fieldName: 'Username',
                      ),
                      controller: _usernameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: requiredValidator(
                        fieldName: 'Password',
                      ),
                      controller: _passwordController,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCancel,
                  child: const Text(
                    'Cancel',
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: FilledButton(
                  onPressed: onSave,
                  child: const Text(
                    'Save',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String? Function(String? value) requiredValidator({
    String fieldName = '',
  }) {
    return (value) {
      final prefix = fieldName.isNotEmpty ? '$fieldName ' : fieldName;
      if (value == null) {
        return '${prefix}is required';
      }
      if (value.isEmpty) {
        return '${prefix}is required';
      }
      return null;
    };
  }

  void onSave() {
    final isFormValid = _formKey.currentState?.validate() == true;
    if (!isFormValid) {
      widget.onSave?.call(null);
      return;
    }
    widget.onSave?.call(
      PubsubClientConfig(
        host: _hostController.text,
        port: int.parse(
          _portController.text,
        ),
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
    return;
  }

  void onCancel() {
    widget.onCancel?.call();
    return;
  }
}
