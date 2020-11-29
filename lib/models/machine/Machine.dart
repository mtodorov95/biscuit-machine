import 'package:biscuits/models/machine/MachineState.dart';

abstract class Machine {
  MachineState state;
  void turnOn();
  void turnOff();
  void pause();
  void work();
}
