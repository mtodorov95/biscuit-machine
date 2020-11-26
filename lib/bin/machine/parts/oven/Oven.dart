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

  void turnOn() {
    print('Oven is on');
    _isOn = true;
    _heater.turnOn();
  }

  void turnOff() {
    print('Oven is off');
    if (_isOn){
      _isOn = false;
      _heater.turnOff();
    }
  }

  void cook(Biscuit biscuit) {
    print('Cooking...');
    biscuit.isCooked = true;
  }
}
