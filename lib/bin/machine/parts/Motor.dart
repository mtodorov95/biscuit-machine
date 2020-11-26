import 'dart:async';
import '../Machine.dart';


class Motor {
  Timer _timer;
  Machine _machine;
  bool _isOn;

  Motor(this._machine){
    _isOn = false;
  }

  void turnOn() {
    print('Motor is on');
    _isOn = true;
    _pulse();
  }

  void turnOff() {
    print('Motor is off');
    if(_isOn){
      _isOn = false;
      _timer.cancel();
    }
  }

  void _pulse() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _machine.work();
    });
  }
}
