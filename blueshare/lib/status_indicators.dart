import 'package:blueshare/bloc/a2dp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/src/provider.dart';

class ConnectionStatusIcon extends StatelessWidget {
  final double size;

  const ConnectionStatusIcon({Key? key, this.size = 80}) : super(key: key);

  IconData _makeStatusIcon(A2dpState state) {
    if (state is A2dpConnecting) {
      return Icons.settings_ethernet;
    } else if (state is A2dpConnected) {
      return Icons.bluetooth_connected;
    } else {
      return Icons.bluetooth;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      _makeStatusIcon(context.select((A2dpBloc bloc) => bloc.state)),
      size: size,
    );
  }
}

class ConnectionStatusHeader extends StatelessWidget {
  final TextStyle? style;

  const ConnectionStatusHeader({Key? key, this.style}) : super(key: key);

  String _makeStatusText(A2dpState state) {
    if (state is A2dpConnecting) {
      return "Connecting...";
    } else if (state is A2dpConnected) {
      return "Connected";
    } else {
      return "Not connected";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _makeStatusText(context.select((A2dpBloc bloc) => bloc.state)),
      style: style,
    );
  }
}
