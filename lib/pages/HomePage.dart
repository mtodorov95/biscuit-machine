import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: SizedBox.expand(
          child: Column(
            children: [
              Text(provider.machineState),
              StreamBuilder<int>(
                stream: provider.temperature,
                builder: (context, snapshot) {
                  return Text('Oven temp: ${snapshot.data}');
                }
              ),
              StreamBuilder<int>(
                stream: provider.output,
                builder: (context, snapshot) {
                  return Text('Output amount: ${snapshot.data}');
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    child: Text('On'),
                    onPressed: (){
                      provider.turnMachineOn();
                    },
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    child: Text('Pause'),
                    onPressed: (){
                      provider.pauseMachine();
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Off'),
                    onPressed: (){
                      provider.turnMachineOff();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}