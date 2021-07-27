part of 'a2dp_bloc.dart';

abstract class A2dpState extends Equatable {
  const A2dpState();
}

class A2dpDisconnected extends A2dpState {
  @override
  List<Object> get props => [];
}

class A2dpConnecting extends A2dpState {
  @override
  List<Object> get props => [];
}

class A2dpConnected extends A2dpState {
  final BluetoothDevice device;

  const A2dpConnected(this.device);

  @override
  List<Object> get props => [device];
}
