part of 'a2dp_bloc.dart';

abstract class A2dpEvent extends Equatable {
  const A2dpEvent();
}

abstract class A2dpConnectionStarted extends A2dpEvent {
  const A2dpConnectionStarted();
}

abstract class A2dpConnectionEstablished extends A2dpEvent {
  final BluetoothDevice device;

  const A2dpConnectionEstablished(this.device);
}

abstract class A2dpConnectionDropped extends A2dpEvent {
  const A2dpConnectionDropped();
}
