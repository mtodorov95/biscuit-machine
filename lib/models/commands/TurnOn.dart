import 'Command.dart';
import 'package:biscuits/models/machine/Machine.dart';

class TurnOn implements Command {
  Machine machine;

  TurnOn(this.machine);

  @override
  void execute() {
    machine.turnOn();
  }
}