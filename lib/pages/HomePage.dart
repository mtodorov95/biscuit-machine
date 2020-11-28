import 'package:biscuits/widgets/ControlButtons.dart';
import 'package:biscuits/widgets/Dashboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dashboard(),
              ControlButtons(),
            ],
          ),
        ),
      ),
    );
  }
}