import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'connection_status.dart';

class ConnectionStatusIcon extends StatelessWidget {
  final ConnectionStatus status;
  final double size;

  const ConnectionStatusIcon({Key? key, required this.status, this.size = 80}) : super(key: key);

  IconData _makeStatusIcon() {
    switch (status) {
      case ConnectionStatus.disconnected:
        return Icons.bluetooth;
      case ConnectionStatus.connecting:
        return Icons.settings_ethernet;
      case ConnectionStatus.connected:
        return Icons.bluetooth_connected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _makeStatusIcon(),
      size: size,
    );
  }
}

class ConnectionStatusHeader extends StatelessWidget {
  final ConnectionStatus status;
  final TextStyle? style;

  const ConnectionStatusHeader({Key? key, required this.status, this.style}) : super(key: key);

  String _makeStatusText() {
    switch (status) {
      case ConnectionStatus.disconnected:
        return "Not connected";
      case ConnectionStatus.connecting:
        return "Connecting...";
      case ConnectionStatus.connected:
        return "Connected";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _makeStatusText(),
      style: style,
    );
  }
}
