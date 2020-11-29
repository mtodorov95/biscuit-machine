import 'package:biscuits/models/commands/Command.dart';
import 'package:biscuits/models/commands/Pause.dart';
import 'package:biscuits/models/commands/TurnOff.dart';
import 'package:biscuits/models/commands/TurnOn.dart';
import 'package:biscuits/models/machine/Machine.dart';
import 'Button.dart';

class Controller {
  Machine _machine;
  Button _turnOn;
  Button _turnOff;
  Button _pause;

  Controller(this._machine) {
    Command turnOnCommand = TurnOn(_machine);
    Command turnOffCommand = TurnOff(_machine);
    Command pauseCommand = Pause(_machine);
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