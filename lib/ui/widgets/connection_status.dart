import 'package:flutter/material.dart';
import 'package:mqtt_client_ui/features/pubsub/pubsub_client_connection_cubit.dart';

class ConnectionStatus extends StatelessWidget {
  final PubsubClientConnectionState pubsubClientConnectionState;

  const ConnectionStatus({
    super.key,
    required this.pubsubClientConnectionState,
  });

  @override
  Widget build(BuildContext context) {
    final meta = pubsubClientConnectionState.maybeMap(
      connected: (value) {
        return (Colors.green, Colors.greenAccent.withOpacity(0.2), 'Connected');
      },
      orElse: () {
        return (Colors.red, Colors.redAccent.withOpacity(0.2), 'Disconnected');
      },
      connecting: (value) {
        return (
          Colors.yellow,
          Colors.yellowAccent.withOpacity(0.2),
          'Connecting'
        );
      },
    );
    final (fontColor, backgroundColor, textStatus) = meta;

    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: backgroundColor,
      ),
      child: Text(
        textStatus,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: fontColor,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
