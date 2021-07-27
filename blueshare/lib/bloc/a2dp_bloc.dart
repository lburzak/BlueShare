import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blueshare/bluetooth_device.dart';
import 'package:equatable/equatable.dart';

part 'a2dp_event.dart';
part 'a2dp_state.dart';

class A2dpBloc extends Bloc<A2dpEvent, A2dpState> {
  A2dpBloc() : super(A2dpDisconnected());

  @override
  Stream<A2dpState> mapEventToState(
    A2dpEvent event,
  ) async* {
    if (event is A2dpConnectionStarted) {
      yield A2dpConnecting();
    } else if (event is A2dpConnectionEstablished) {
      yield A2dpConnected(event.device);
    } else if (event is A2dpConnectionDropped) {
      yield A2dpDisconnected();
    }
  }
}
