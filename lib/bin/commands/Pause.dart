import 'package:biscuits/bin/machine/Machine.dart';
import 'Command.dart';


class Pause implements Command {
  Machine machine;

  Pause(this.machine);

  @override
  void execute() {
    machine.pause();
  }
}
