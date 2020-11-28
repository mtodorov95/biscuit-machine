import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            padding: const EdgeInsets.all(20),
            color: Colors.green,
            child: Text('On'),
            onPressed: (){
              provider.turnMachineOn();
            },
          ),
          RaisedButton(
            padding: const EdgeInsets.all(20),
            color: Colors.orange,
            child: Text('Pause'),
            onPressed: (){
              provider.pauseMachine();
            },
          ),
          RaisedButton(
            padding: const EdgeInsets.all(20),
            color: Colors.red,
            child: Text('Off'),
            onPressed: (){
              provider.turnMachineOff();
            },
          ),
        ],
      ),
    );
  }
}
