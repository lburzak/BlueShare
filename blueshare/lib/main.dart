import 'package:blueshare/connection_page.dart';
import 'package:flutter/material.dart';

import 'connection_status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff334575),
          colorScheme: const ColorScheme.dark(
              background: Color(0xff334575),
              onBackground: Color.fromARGB(128, 0x45, 0x5d, 0x8b)
          ),
          textTheme: Typography.whiteMountainView.copyWith(
              headline1: Typography.whiteMountainView.headline1!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 28,
                  color: Colors.white),
              headline5: Typography.whiteMountainView.headline5!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.white,))),
      home: const Scaffold(
        body: ConnectionPage(
            status: ConnectionStatus.connecting
        ),
      ),
    );
  }
}
