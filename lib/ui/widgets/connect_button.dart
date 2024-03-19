import 'package:flutter/material.dart';

enum ConnectButtonState {
  connected("Connected", Colors.greenAccent),
  disconnected("Disconnected", Colors.redAccent),
  reconnecting("Force Disconnect", Colors.orangeAccent),
  connecting("Connecting", Colors.yellowAccent);

  final String label;
  final Color color;
  const ConnectButtonState(
    this.label,
    this.color,
  );
}

/// Button that handle connection
class ConnectButton extends StatelessWidget {
  final ConnectButtonState connectButtonState;
  final void Function()? onConnectDisconnect;
  const ConnectButton({
    super.key,
    required this.connectButtonState,
    this.onConnectDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FilledButton(
                onPressed: onConnectDisconnect,
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.zero,
                  ),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStatePropertyAll(
                    connectButtonState.color,
                  ),
                ),
                child: switch (connectButtonState) {
                  ConnectButtonState.connected => const Icon(
                      Icons.power_off,
                    ),
                  ConnectButtonState.disconnected => const Icon(
                      Icons.power,
                    ),
                  ConnectButtonState.connecting => Text(
                      ConnectButtonState.connecting.label,
                    ),
                  _ => Text(
                      ConnectButtonState.reconnecting.label,
                    ),
                },
              ),
            )
          ],
        );
      },
    );
  }
}
