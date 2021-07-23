
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bluetooth = FlutterBluetoothSerial.instance;

  @override
  Widget build(BuildContext context) =>
      FutureBuilder<List<BluetoothDevice>>(
        future: _bluetooth.getBondedDevices(),
        builder: (context, snapshot) =>
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data![index].name!)
            ),
            itemCount: snapshot.hasData ? snapshot.data!.length : 0
          )
        );
}