import 'package:flutter/widgets.dart';

import 'bluetooth_device.dart';

class DeviceInfo extends StatelessWidget {
  final BluetoothDevice? device;

  const DeviceInfo({Key? key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return device != null
        ? Column(
      children: [Text(device!.name), Text(device!.address)],
    )
        : const SizedBox.shrink();
  }
}
