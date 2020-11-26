import 'Command.dart';
import 'package:biscuits/bin/machine/Machine.dart';

class TurnOff implements Command {
  Machine machine;

  TurnOff(this.machine);

  @override
  void execute() {
    machine.turnOff();
  }
}
