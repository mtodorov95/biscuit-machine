import 'dart:async';
import 'Oven.dart';

class HeatingElement {
  Oven _oven;
  Timer _heating;
  Timer _cooling;
  int _maxTemp;
  int _cookingTemp;
  int _currentTemp;
  bool _isHeating;

  HeatingElement(this._oven) {
    _maxTemp = 240;
    _cookingTemp = 220;
    _currentTemp = 0;
    _isHeating = false;
  }

  void turnOn() {
    _heatUp();
  }

  void _heatUp() {
    if (_cooling != null) {
      print('Cancel cooling');
      _cooling.cancel();
    }
    if (!_isHeating) {
      _isHeating = true;
      _heating = Timer.periodic(Duration(milliseconds: 50), (timer) {
        if (_currentTemp < _maxTemp) {
          _currentTemp++;
        } else {
          print('Heating off');
          _coolOff();
        }
        if (_currentTemp > _cookingTemp) {
          _oven.isReady = true;
        }
      });
    }
  }

  void _coolOff() {
    if (_heating != null) {
      print('Cancel heating');
      _heating.cancel();
    }
    if (_isHeating) {
      _isHeating = false;
      _cooling = Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (_currentTemp > _cookingTemp) {
          _currentTemp--;
        } else {
          _oven.isReady = false;
          print('Heating on');
          turnOn();
        }
      });
    }
  }

  void turnOff() {
    print('Stopping heating element');
    if (_cooling != null) _cooling.cancel();
    if (_heating != null) _heating.cancel();
  }
}
