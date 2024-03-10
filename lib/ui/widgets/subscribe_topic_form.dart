import 'package:flutter/material.dart';

class SubscribeTopicForm extends StatefulWidget {
  final ValueChanged<String>? onAddTopic;
  const SubscribeTopicForm({
    super.key,
    this.onAddTopic,
  });

  @override
  State<SubscribeTopicForm> createState() => _SubscribeTopicFormState();
}

class _SubscribeTopicFormState extends State<SubscribeTopicForm> {
  final TextEditingController _topicController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscribe Topic',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _topicController,
                  validator: (value) {
                    if (value == null) {
                      return 'Topic required';
                    }
                    if (value.isEmpty) {
                      return 'Topic required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Topic',
                    suffixIcon: IconButton(
                      onPressed: onAddTopic,
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void onAddTopic() {
    final isFormValid = _formKey.currentState?.validate() == true;
    if (!isFormValid) {
      return;
    }
    widget.onAddTopic?.call(
      _topicController.text,
    );
    _topicController.clear();
    return;
  }
}
