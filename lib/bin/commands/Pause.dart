import 'Command.dart';
import 'Machine.dart';

class Pause implements Command {
  Machine machine;

  Pause(this.machine);

  @override
  void execute() {
    machine.pause();
  }
}
