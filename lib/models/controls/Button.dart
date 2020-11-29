import 'package:biscuits/models/commands/Command.dart';

class Button {
  Command command;

  Button(this.command);

  void press() {
    command.execute();
  }
}
