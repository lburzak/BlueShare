import 'package:blueshare/bluetooth_device.dart';
import 'package:blueshare/connection_status.dart';
import 'package:blueshare/status_indicators.dart';
import 'package:blueshare/util/mock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/a2dp_bloc.dart';
import 'controls.dart';
import 'device_info.dart';

class ConnectionPage extends StatelessWidget {
  final ConnectionStatus status;
  final BluetoothDevice? device;

  const ConnectionPage({Key? key, required this.status, this.device})
      : super(key: key);

  A2dpEvent nextEvent() {
    switch (status) {
      case ConnectionStatus.disconnected:
        return const A2dpConnectionStarted();
      case ConnectionStatus.connecting:
        return const A2dpConnectionEstablished(mockDevice);
      case ConnectionStatus.connected:
        return const A2dpConnectionDropped();
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      RoundButton(
        icon: Icons.menu,
        onPressed: () {
          Navigator.pushNamed(context, '/devices');
        },
      ),
      RoundButton(
        icon: Icons.stream,
        onPressed: () {
          context.read<A2dpBloc>().add(nextEvent());
        },
      )
    ];

    if (status != ConnectionStatus.disconnected) {
      final disconnectButton = RoundButton(
        icon: Icons.bluetooth_disabled,
        onPressed: () {},
      );

      buttons.add(disconnectButton);
    }

    if (status == ConnectionStatus.connected) {
      final shareButton = RoundButton(
        icon: Icons.wifi_tethering,
        onPressed: () {},
      );

      buttons.add(shareButton);
    }

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: ConnectionStatusHeader(
                    status: status,
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: ConnectionStatusIcon(status: status),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: status == ConnectionStatus.disconnected
                      ? Text(
                          "Connect to a Bluetooth Audio device to start sharing",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        )
                      : Visibility(
                          visible: status == ConnectionStatus.connected,
                          child: DeviceInfo(device: device),
                        ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: buttons,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
