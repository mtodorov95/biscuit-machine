import 'package:biscuits/bin/commands/Command.dart';
import 'package:biscuits/bin/commands/Pause.dart';
import 'package:biscuits/bin/commands/TurnOff.dart';
import 'package:biscuits/bin/commands/TurnOn.dart';
import 'package:biscuits/bin/machine/Machine.dart';
import 'Button.dart';

class Controller {
  Machine machine;
  Button _turnOn;
  Button _turnOff;
  Button _pause;

  Controller(this.machine) {
    Command turnOnCommand = TurnOn(machine);
    Command turnOffCommand = TurnOff(machine);
    Command pauseCommand = Pause(machine);
    _turnOn = Button(turnOnCommand);
    _turnOff = Button(turnOffCommand);
    _pause = Button(pauseCommand);
  }

  void pressOn() {
    _turnOn.press();
  }

  void pressPause() {
    _pause.press();
  }

  void pressOff() {
    _turnOff.press();
  }
}