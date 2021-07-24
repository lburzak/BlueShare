class BluetoothDevice {
  final String name;
  final String address;
  final bool isShared;

  const BluetoothDevice({required this.name, required this.address, this.isShared = false});
}