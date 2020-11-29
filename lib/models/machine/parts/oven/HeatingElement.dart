import 'dart:async';
import 'Oven.dart';

class HeatingElement {
  Oven _oven;
  Timer _heating;
  Timer _cooling;
  Timer _toZero;
  int _maxTemp;
  int _cookingTemp;
  int _currentTemp;
  bool _isHeating;

  HeatingElement(this._oven) {
    _maxTemp = 240;
    _cookingTemp = 220;
    _currentTemp = 0;
    _streamController.add(_currentTemp);
    _isHeating = false;
  }

  StreamController<int> _streamController = StreamController<int>();
  Stream<int> get temperature => _streamController.stream;

  void turnOn() {
    _heatUp();
  }

  void _heatUp() {
    if (_cooling != null) _cooling.cancel();
    if(_toZero != null) _toZero.cancel();
    if (_isHeating == false) {
      _isHeating = true;
      _heating = Timer.periodic(Duration(milliseconds: 75), (timer) {
        if (_currentTemp < _maxTemp) {
          _currentTemp++;
          _streamController.add(_currentTemp);
        } else {
          timer.cancel();
          _coolOff();
        }
        if (_currentTemp > _cookingTemp) {
          _oven.isReady = true;
        }
      });
    }
  }

  void _coolOff() {
    if (_heating != null) _heating.cancel();
    if (_isHeating == true) {
      _isHeating = false;
      _cooling = Timer.periodic(Duration(milliseconds: 100), (timer) {
        if (_currentTemp > _cookingTemp) {
          _currentTemp--;
          _streamController.add(_currentTemp);
        } else {
          _oven.isReady = false;
          timer.cancel();
          turnOn();
        }
      });
    }
  }

  void turnOff() {
    if (_cooling != null) _cooling.cancel();
    if (_heating != null) _heating.cancel();
    _isHeating = false;
    _coolToZero();
  }

  void _coolToZero(){
    _toZero = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if(_currentTemp > 0){
        _currentTemp--;
        _streamController.add(_currentTemp);
      } else {
        timer.cancel();
      }
      if(_currentTemp <_cookingTemp){
        _oven.isReady = false;
      }
    });
  }
}
