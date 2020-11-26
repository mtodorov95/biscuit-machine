import 'package:biscuits/bin/controls/Controller.dart';
import 'package:biscuits/bin/machine/BiscuitMachine.dart';
import 'package:biscuits/bin/machine/Machine.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BiscuitMachine biscuitMachine;
  Controller machineController;
  String machineState;

  @override
  void initState() {
    super.initState();
    biscuitMachine = BiscuitMachine();
    machineController = Controller(biscuitMachine);
    machineState = 'Machine is Off';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SizedBox.expand(
          child: Column(
            children: [
              Text(machineState),
              StreamBuilder<int>(
                stream: biscuitMachine.oven.heater.temperature,
                builder: (context, snapshot) {
                  return Text('Oven temp: ${snapshot.data}');
                }
              ),
              StreamBuilder<int>(
                stream: biscuitMachine.output.amount,
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
                      machineController.pressOn();
                      setState(() {
                        machineState = 'Machine is On';
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    child: Text('Pause'),
                    onPressed: (){
                      machineController.pressPause();
                      setState(() {
                        machineState = 'Machine is Paused';
                      });
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Off'),
                    onPressed: (){
                      machineController.pressOff();
                      setState(() {
                        machineState = 'Machine is Off';
                      });
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