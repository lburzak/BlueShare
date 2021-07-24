import 'package:blueshare/bluetooth_device.dart';
import 'package:blueshare/controls.dart';
import 'package:blueshare/device_info.dart';
import 'package:blueshare/status_indicators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'connection_status.dart';

class ConnectionBar extends StatelessWidget {
  final ConnectionStatus status;
  final BluetoothDevice? device;

  const ConnectionBar({Key? key, required this.status, this.device})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Material(
              type: MaterialType.canvas,
              elevation: 4,
              child: status != ConnectionStatus.connected
                  ? _ConnectionBarDisconnected(status: status)
                  : _ConnectionBarConnected(device: device)),
        ),
      );
}

class _ConnectionBarDisconnected extends StatelessWidget {
  const _ConnectionBarDisconnected({
    Key? key,
    required this.status,
  }) : super(key: key);

  final ConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: ConnectionStatusIcon(
            status: status,
            size: 48,
          ),
        ),
        ConnectionStatusHeader(
          status: status,
          style: Theme.of(context).textTheme.headline2,
        )
      ],
    );
  }
}

class _ConnectionBarConnected extends StatelessWidget {
  final BluetoothDevice? device;

  const _ConnectionBarConnected({Key? key, required this.device})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeviceInfo(
              device: device,
              linesAlignment: CrossAxisAlignment.start,
              nameStyle: Theme.of(context).textTheme.headline6,
            ),
            RoundButton(icon: Icons.wifi_tethering)
          ],
        ),
      );
}
