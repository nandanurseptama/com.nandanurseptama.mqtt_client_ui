import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client_ui/features/pubsub/subscription_cubit.dart';

class SubscribedTopic extends StatefulWidget {
  final SubscriptionState subscriptionState;
  const SubscribedTopic({
    super.key,
    required this.subscriptionState,
  });

  @override
  State<SubscribedTopic> createState() => _SubscribedTopicState();
}

class _SubscribedTopicState extends State<SubscribedTopic> {
  @override
  Widget build(BuildContext context) {
    if (widget.subscriptionState.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Topic List',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: widget.subscriptionState.entries.map((e) {
                return ExpansionTile(
                  title: const Text('Topic'),
                  subtitle: Text(e.key),
                  children: List.generate(e.value.length, (index) {
                    return ListTile(
                      subtitle: Text(
                        payloadToString(
                          e.value[index],
                        ),
                      ),
                    );
                  }),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }

  String payloadToString(MqttPublishMessage message) {
    final payload =
        MqttPublishPayload.bytesToStringAsString(message.payload.message);
    return payload;
  }
}
