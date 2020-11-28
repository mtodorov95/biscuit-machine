import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Display.dart';
import 'TemperatureIndicator.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.wb_sunny_rounded,
                    color: provider.motorIsOn ? Colors.green : Colors.black54,
                  ),
                  Text(
                      'Motor',
                    style: TextStyle(
                        color: Colors.white
                    ),
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
                    color: provider.ovenIsOn ? Colors.green : Colors.black54,
                  ),
                  Text(
                      'Oven',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ],
          ),
          Display(),
          TemperatureIndicator(),
        ],
      ),
    );
  }
}
