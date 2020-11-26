import 'Command.dart';

class TurnOn implements Command {
  Machine machine;

  TurnOn(this.machine);

  @override
  void execute() {
    machine.turnOn();
  }
}