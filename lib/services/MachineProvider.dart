import 'package:biscuits/models/controls/Controller.dart';
import 'package:biscuits/models/machine/BiscuitMachine.dart';
import 'package:biscuits/models/machine/MachineState.dart';
import 'package:flutter/material.dart';

class MachineProvider extends ChangeNotifier{
  BiscuitMachine _biscuitMachine;
  Controller _machineController;

  MachineProvider(){
    _biscuitMachine = BiscuitMachine();
    _machineController = Controller(_biscuitMachine);
  }

  String get machineState => _getMachineState();
  Stream<int> get temperature => _biscuitMachine.ovenTemperature;
  Stream<int> get output => _biscuitMachine.output;
  bool get ovenIsOn => _biscuitMachine.ovenOn;
  bool get motorIsOn => _biscuitMachine.motorOn;

  String _getMachineState(){
    switch(_biscuitMachine.state){
      case MachineState.On:
        return 'Machine is On';
        break;
      case MachineState.Paused:
        return 'Machine is Paused';
        break;
      case MachineState.Off:
        return 'Machine is Off';
        break;
      default:
        return '';
    }
  }

  void turnMachineOn(){
    _machineController.pressOn();
    notifyListeners();
  }

  void pauseMachine(){
    _machineController.pressPause();
    notifyListeners();
  }

  void turnMachineOff(){
    _machineController.pressOff();
    notifyListeners();
  }
}