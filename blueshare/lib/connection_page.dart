import 'package:blueshare/bluetooth_device.dart';
import 'package:blueshare/connection_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ConnectionPage extends StatelessWidget {
  final ConnectionStatus status;
  final BluetoothDevice? device;

  const ConnectionPage({Key? key, required this.status, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: _StatusHeader(status: status),
                ),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: _StatusIcon(status: status),
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
                            child: _DeviceInfo(
                              device: device
                            ),
                          ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton(
                        icon: Icons.menu,
                        onPressed: () {},
                      ),
                      Visibility(
                        visible: status != ConnectionStatus.disconnected,
                        child: _RoundButton(
                          icon: Icons.bluetooth_disabled,
                          onPressed: () {},
                        ),
                      ),
                      Visibility(
                        visible: status == ConnectionStatus.connected,
                        child: _RoundButton(
                          icon: Icons.wifi_tethering,
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

class _StatusHeader extends StatelessWidget {
  final ConnectionStatus status;

  const _StatusHeader({Key? key, required this.status}) : super(key: key);

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
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final ConnectionStatus status;

  const _StatusIcon({required this.status});

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
      size: 80,
    );
  }
}

class _RoundButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;

  const _RoundButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Ink(
      decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          shape: const CircleBorder()),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
      ));
}

class _DeviceInfo extends StatelessWidget {
  final BluetoothDevice? device;

  const _DeviceInfo({Key? key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return device != null
        ? Column(
            children: [Text(device!.name), Text(device!.address)],
          )
        : const SizedBox.shrink();
  }
}
