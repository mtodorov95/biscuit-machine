import 'dart:async';
import '../Machine.dart';


class Motor {
  Timer timer;
  Machine machine;

  Motor(this.machine);

  void turnOn() {
    print('Motor is on');
    _pulse();
  }

  void turnOff() {
    print('Motor is off');
    timer.cancel();
  }

  void _pulse() {
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      machine.work();
    });
  }
}
