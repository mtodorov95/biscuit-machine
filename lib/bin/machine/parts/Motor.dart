import 'dart:async';
import '../Machine.dart';


class Motor {
  Timer _timer;
  Machine _machine;
  bool _isOn;
  bool _notPulsing;

  Motor(this._machine){
    _isOn = false;
    _notPulsing = true;
  }

  void turnOn() {
    _isOn = true;
    _pulse();
  }

  void turnOff() {
    if(_isOn){
      _isOn = false;
      _notPulsing = true;
      _timer.cancel();
    }
  }

  void _pulse() {
    if(_notPulsing){
      _notPulsing = false;
      _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        _machine.work();
      });
    }
  }
}
