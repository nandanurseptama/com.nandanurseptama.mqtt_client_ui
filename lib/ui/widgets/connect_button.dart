import 'package:flutter/material.dart';

/// Button that handle connection
class ConnectButton extends StatelessWidget {
  final bool isConnected;
  final void Function()? onConnectDisconnect;
  const ConnectButton({
    super.key,
    this.onConnectDisconnect,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: onConnectDisconnect,
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(80, 80),
                ),
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                alignment: Alignment.center,
                backgroundColor: MaterialStatePropertyAll(
                  isConnected ? Colors.redAccent : Colors.greenAccent,
                ),
              ),
              child: Icon(isConnected ? Icons.power_off : Icons.power),
            )
          ],
        );
      },
    );
  }
}
