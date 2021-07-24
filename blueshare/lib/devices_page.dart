import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bluetooth_device.dart';

class DevicesPage extends StatelessWidget {
  final Stream<List<BluetoothDevice>> devicesStream; 
  
  const DevicesPage({Key? key, required this.devicesStream}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      StreamBuilder<List<BluetoothDevice>>(
        stream: devicesStream,
        builder: (context, snapshot) =>
            ListView.builder(
              itemCount: snapshot.hasData ? snapshot.data!.length : 0,
              itemBuilder: (context, index) =>
                  _DeviceTile(
                      device: snapshot.data![index]
                  ),
            ),
      );
}

class _DeviceTile extends StatelessWidget {
  final BluetoothDevice device;

  const _DeviceTile({Key? key, required this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ListTile(
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(Icons.headset)
        ),
        title: Text(device.name),
        subtitle: Text(device.address),
        trailing: device.isShared ? const SizedBox(
            height: double.infinity,
            child: Icon(Icons.wifi_tethering)
        ) : null,
      );
}