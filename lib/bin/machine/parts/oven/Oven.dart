import 'package:biscuits/bin/biscuits/Biscuit.dart';
import 'HeatingElement.dart';

class Oven {
  bool isReady;
  bool _isOn;
  HeatingElement _heater;

  Oven() {
    _heater = HeatingElement(this);
    _isOn = false;
    isReady = false;
  }

  HeatingElement get heater => _heater;
  bool get isOn => _isOn;

  void turnOn() {
    _isOn = true;
    _heater.turnOn();
  }

  void turnOff() {
    if (_isOn){
      _isOn = false;
      _heater.turnOff();
    }
  }

  void cook(Biscuit biscuit) {
    biscuit.isCooked = true;
  }
}
