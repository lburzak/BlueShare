import 'package:blueshare/status_indicators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'connection_status.dart';

class ConnectionBar extends StatelessWidget {
  final ConnectionStatus status;

  const ConnectionBar({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () { Navigator.pop(context); },
    child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Material(
            type: MaterialType.canvas,
            elevation: 4,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ConnectionStatusIcon(
                    status: status,
                    size: 48,
                  ),
                ),
                ConnectionStatusHeader(status: status, style: Theme.of(context).textTheme.headline2,)
              ],
            ),
          ),
        ),
  );
}
