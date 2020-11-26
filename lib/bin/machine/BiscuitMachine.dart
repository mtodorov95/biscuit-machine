import 'package:biscuits/bin/machine/parts/Conveyor.dart';
import 'package:biscuits/bin/machine/parts/Extruder.dart';
import 'package:biscuits/bin/machine/parts/Motor.dart';
import 'package:biscuits/bin/machine/parts/Output.dart';
import 'package:biscuits/bin/machine/parts/Stamper.dart';
import 'package:biscuits/bin/machine/parts/oven/Oven.dart';

import 'Machine.dart';

class BiscuitMachine implements Machine {
  Conveyor conveyor;
  Motor motor;
  Extruder extruder;
  Stamper stamper;
  Oven oven;
  Output output;

  BiscuitMachine() {
    conveyor = Conveyor();
    motor = Motor(this);
    extruder = Extruder();
    stamper = Stamper();
    oven = Oven();
    output = Output();
  }

  @override
  void pause() {
    print('Machine is paused');
    motor.turnOff();
  }

  @override
  void turnOff() {
    print('Machine is off');
    oven.turnOff();
    motor.turnOff();
    print(conveyor.biscuits);
  }

  @override
  void turnOn() {
    print('Machine is on');
    oven.turnOn();
    motor.turnOn();
  }

  @override
  void work() {
    if (oven.isReady) {
      conveyor.add(extruder.pulse());
      stamper.pulse(conveyor.getFirst());
      oven.cook(conveyor.getFirst());
      output.add(conveyor.removeFirst());
    }
  }
}
