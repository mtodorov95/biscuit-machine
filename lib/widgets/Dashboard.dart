import 'package:biscuits/widgets/ActivityIndicators.dart';
import 'package:flutter/material.dart';
import 'Display.dart';
import 'TemperatureIndicator.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActivityIndicators(),
          Display(),
          TemperatureIndicator(),
        ],
      ),
    );
  }
}
