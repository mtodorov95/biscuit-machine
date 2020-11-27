import 'package:biscuits/bin/machine/MachineState.dart';

abstract class Machine {
  MachineState state;
  void turnOn();
  void turnOff();
  void pause();
  void work();
}
