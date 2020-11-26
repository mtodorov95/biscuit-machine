import 'package:biscuits/bin/biscuits/Biscuit.dart';

import 'HeatingElement.dart';

class Oven {
  bool isReady;
  HeatingElement heater;

  Oven() {
    heater = HeatingElement(this);
    isReady = false;
  }

  void turnOn() {
    print('Oven is on');
    heater.turnOn();
  }

  void turnOff() {
    print('Oven is off');
    heater.turnOff();
  }

  void cook(Biscuit biscuit) {
    print('Cooking...');
    biscuit.isCooked = true;
  }
}
