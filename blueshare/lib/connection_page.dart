import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ConnectionPage extends StatelessWidget {
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
                  child: Text(
                    "Not connected",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              const Flexible(
                flex: 3,
                child: Center(
                  child: Icon(
                    Icons.bluetooth,
                    size: 80,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Text(
                      "Connect to a Bluetooth Audio device to start sharing",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Ink(
                      decoration: const ShapeDecoration(
                          color: Color.fromARGB(128, 0x45, 0x5d, 0x8b),
                          shape: CircleBorder()),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      )),
                ),
              )
            ],
          ),
    ),
  );
}
