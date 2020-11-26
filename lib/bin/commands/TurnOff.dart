import 'Command.dart';
import 'Machine.dart';

class TurnOff implements Command {
  Machine machine;

  TurnOff(this.machine);

  @override
  void execute() {
    machine.turnOff();
  }
}
