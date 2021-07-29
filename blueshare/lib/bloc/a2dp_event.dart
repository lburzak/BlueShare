part of 'a2dp_bloc.dart';

abstract class A2dpEvent extends Equatable {
  const A2dpEvent();
}

class A2dpConnectionStarted extends A2dpEvent {
  const A2dpConnectionStarted();

  @override
  List<Object?> get props => [];
}

class A2dpConnectionEstablished extends A2dpEvent {
  final BluetoothDevice device;

  const A2dpConnectionEstablished(this.device);

  @override
  List<Object?> get props => [device];
}

class A2dpConnectionDropped extends A2dpEvent {
  const A2dpConnectionDropped();

  @override
  List<Object?> get props => [];
}

class A2dpConnectionRequested extends A2dpEvent {
  final BluetoothDevice device;

  const A2dpConnectionRequested(this.device);

  @override
  List<Object> get props => [];
}
