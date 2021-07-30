import 'package:blueshare/status_indicators.dart';
import 'package:blueshare/util/mock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_a2dp/bluetooth_device.dart';
import 'package:flutter_a2dp/flutter_a2dp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/a2dp_bloc.dart';
import 'controls.dart';
import 'device_info.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  A2dpEvent nextEvent(A2dpState state) {
    if (state is A2dpDisconnected) {
      return const A2dpConnectionStarted();
    } else {
      return const A2dpConnectionDropped();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((A2dpBloc bloc) => bloc.state);

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
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
            const Flexible(
              flex: 3,
              child: Center(
                child: ConnectionStatusIcon(),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: state is A2dpDisconnected
                      ? Text(
                          "Connect to a Bluetooth Audio device to start sharing",
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        )
                      : Visibility(
                          visible: state is A2dpConnected,
                          child: DeviceInfo(device: context.selectA2dpDevice()),
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
                    RoundButton(
                      icon: Icons.menu,
                      onPressed: () {
                        Navigator.pushNamed(context, '/devices');
                      },
                    ),
                    RoundButton(
                      icon: Icons.stream,
                      onPressed: () {
                        context.read<A2dpBloc>().add(nextEvent(state));
                      },
                    ),
                    RoundButton(
                      icon: Icons.bluetooth_disabled,
                      onPressed: state is A2dpDisconnected ? null : () { _disconnect(context); },
                    ),
                    RoundButton(
                      icon: Icons.wifi_tethering,
                      onPressed: state is A2dpConnected ? _share : null,
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

  _disconnect(BuildContext context) {
    context.read<A2dpBloc>().add(A2dpDisconnectRequested());
  }

  _share() {}
}

extension on BuildContext {
  BluetoothDevice? selectA2dpDevice() => select((A2dpBloc bloc) {
        final state = bloc.state;
        return state is A2dpConnected ? state.device : null;
      });
}
