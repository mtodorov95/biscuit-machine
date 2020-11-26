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

  Machine biscuitMachine;
  Controller machineController;

  @override
  void initState() {
    super.initState();
    biscuitMachine = BiscuitMachine();
    machineController = Controller(biscuitMachine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          children: [
            RaisedButton(
              color: Colors.green,
              child: Text('On'),
              onPressed: (){
                machineController.pressOn();
              },
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text('Pause'),
              onPressed: (){
                machineController.pressPause();
              },
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Off'),
              onPressed: (){
                machineController.pressOff();
              },
            ),
          ],
        ),
      ),
    );
  }
}