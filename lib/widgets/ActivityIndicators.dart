import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              Icons.wb_sunny_rounded,
              color: provider.motorIsOn ? Colors.green : Colors.black54,
            ),
            Text(
              'Conveyor',
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
    );
  }
}
