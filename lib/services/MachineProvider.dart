import 'package:biscuits/bin/controls/Controller.dart';
import 'package:biscuits/bin/machine/BiscuitMachine.dart';
import 'package:biscuits/bin/machine/MachineState.dart';
import 'package:flutter/cupertino.dart';

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