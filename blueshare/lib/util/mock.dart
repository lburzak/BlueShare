import '../bluetooth_device.dart';

const BluetoothDevice mockDevice = BluetoothDevice(
    name: "Mi True Wireless EBs Basic 2", address: "53:1B:22:05:13:5B"
);

const BluetoothDevice mockDeviceTwo = BluetoothDevice(
    name: "Mi True Wireless EBs Basic 2",
    address: "53:1B:22:05:13:5B",
    isShared: true
);