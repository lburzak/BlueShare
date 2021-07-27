import 'package:blueshare/bloc/a2dp_bloc.dart';
import 'package:blueshare/connection_page.dart';
import 'package:blueshare/devices_page.dart';
import 'package:blueshare/util/mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final status = ConnectionStatus.connected;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => A2dpBloc(),
      child: MaterialApp(
        title: 'BlueShare',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Scaffold(
            body: ConnectionPage(),
          ),
          '/devices': (context) {
            final state = context.select((A2dpBloc bloc) => bloc.state);

            return Scaffold(
              body: DevicesPage(
                status: state.toConnectionStatus(),
                device: state is A2dpConnected ? state.device : null,
                devicesStream: Stream.value(List.of([
                  mockDevice,
                  mockDeviceTwo,
                  mockDevice,
                  mockDevice,
                  mockDevice,
                  mockDevice
                ])),
              ),
            );
          }
        },
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xff334575),
            colorScheme: const ColorScheme.dark(
                background: Color(0xff334575),
                onBackground: Color.fromARGB(128, 0x45, 0x5d, 0x8b)),
            canvasColor: Color(0xff334575),
            textTheme: Typography.whiteMountainView.copyWith(
              headline1: Typography.whiteMountainView.headline1!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                  color: Colors.white),
              headline2: Typography.whiteMountainView.headline2!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                  color: Colors.white),
              headline5: Typography.whiteMountainView.headline5!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.white,
              ),
              headline6: Typography.whiteMountainView.headline6!.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}

extension on A2dpState {
  ConnectionStatus toConnectionStatus() {
    if (this is A2dpConnected) {
      return ConnectionStatus.connected;
    } else if (this is A2dpConnecting) {
      return ConnectionStatus.connecting;
    } else if (this is A2dpDisconnected) {
      return ConnectionStatus.disconnected;
    } else {
      return ConnectionStatus.disconnected;
    }
  }
}
