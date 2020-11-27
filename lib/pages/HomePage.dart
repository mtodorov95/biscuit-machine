import 'package:biscuits/services/MachineProvider.dart';
import 'package:biscuits/widgets/OutputBox.dart';
import 'package:biscuits/widgets/TemperatureIndicator.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.wb_sunny_rounded,
                            color: provider.motorIsOn ? Colors.green : Colors.red,
                          ),
                          Text(
                            'Motor'
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Icon(
                              Icons.wb_sunny_rounded,
                            color: provider.ovenIsOn ? Colors.green : Colors.red,
                          ),
                          Text(
                              'Oven'
                          )
                        ],
                      ),
                    ],
                  ),
                  OutputBox(),
                  TemperatureIndicator(),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.grey[800],
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                  child: Text(
                      provider.machineState,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
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