import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemperatureIndicator extends StatelessWidget {


  Color _getColor(int temp){
    if(temp < 100){
      return Colors.green;
    } else if (temp < 180){
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return StreamBuilder<int>(
        stream: provider.temperature,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Column(
              children: [
                Container(
                  height: 240,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          color: _getColor(snapshot.data),
                          height: snapshot.data.toDouble(),
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${snapshot.data} °C',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            );
          }
          return Container();
        }
    );
  }
}