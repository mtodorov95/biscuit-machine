import 'package:biscuits/bin/machine/MachineState.dart';
import 'package:biscuits/bin/machine/parts/Conveyor.dart';
import 'package:biscuits/bin/machine/parts/Extruder.dart';
import 'package:biscuits/bin/machine/parts/Motor.dart';
import 'package:biscuits/bin/machine/parts/Output.dart';
import 'package:biscuits/bin/machine/parts/Stamper.dart';
import 'package:biscuits/bin/machine/parts/oven/Oven.dart';
import 'Machine.dart';

class BiscuitMachine implements Machine {
  @override
  MachineState state;

  Conveyor _conveyor;
  Motor _motor;
  Extruder _extruder;
  Stamper _stamper;
  Oven _oven;
  Output _output;

  BiscuitMachine() {
    state = MachineState.Off;
    _conveyor = Conveyor();
    _motor = Motor(this);
    _extruder = Extruder();
    _stamper = Stamper();
    _oven = Oven();
    _output = Output();
  }

  Stream<int> get output => _output.amount;
  Stream<int> get ovenTemperature => _oven.heater.temperature;

  @override
  void pause() {
    if(state == MachineState.On){
      state = MachineState.Paused;
      _motor.turnOff();
    }
  }

  @override
  void turnOff() {
    if(state != MachineState.Off){
      state = MachineState.Off;
      _oven.turnOff();
      _motor.turnOff();
    }
  }

  @override
  void turnOn() {
    if(state != MachineState.On){
      state = MachineState.On;
      _oven.turnOn();
      _motor.turnOn();
    }
  }

  @override
  void work() {
    if (_oven.isReady) {
      _conveyor.add(_extruder.pulse());
      _stamper.pulse(_conveyor.getFirst());
      _oven.cook(_conveyor.getFirst());
      _output.add(_conveyor.removeFirst());
    }
  }
}
