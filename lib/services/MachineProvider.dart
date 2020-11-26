import 'package:biscuits/bin/controls/Controller.dart';
import 'package:biscuits/bin/machine/BiscuitMachine.dart';
import 'package:biscuits/bin/machine/Machine.dart';
import 'package:flutter/cupertino.dart';

class MachineProvider extends ChangeNotifier{
  BiscuitMachine _biscuitMachine;
  Controller _machineController;
  String _machineState;

  MachineProvider(){
    _biscuitMachine = BiscuitMachine();
    _machineController = Controller(_biscuitMachine);
    _machineState = 'Machine is Off';
  }

  String get machineState => _machineState;

  Stream<int> get temperature => _biscuitMachine.oven.heater.temperature;

  Stream<int> get output => _biscuitMachine.output.amount;

  void turnMachineOn(){
    _machineController.pressOn();
    _machineState = 'Machine is On';
    notifyListeners();
  }

  void pauseMachine(){
    _machineController.pressPause();
    _machineState = 'Machine is Paused';
    notifyListeners();
  }

  void turnMachineOff(){
    _machineController.pressOff();
    _machineState = 'Machine is Off';
    notifyListeners();
  }
}