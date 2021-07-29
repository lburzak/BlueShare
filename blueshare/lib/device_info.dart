import 'package:flutter/widgets.dart';
import 'package:flutter_a2dp/bluetooth_device.dart';

class DeviceInfo extends StatelessWidget {
  final BluetoothDevice? device;
  final CrossAxisAlignment linesAlignment;
  final TextStyle? nameStyle;

  const DeviceInfo(
      {Key? key, this.device, this.linesAlignment = CrossAxisAlignment.center, this.nameStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return device != null
        ? Column(
            crossAxisAlignment: linesAlignment,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(device!.name, style: nameStyle,), Text(device!.address)],
          )
        : const SizedBox.shrink();
  }
}
