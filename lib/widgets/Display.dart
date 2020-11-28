import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return StreamBuilder<int>(
        stream: provider.output,
        builder: (context, snapshot) {
          return Container(
              width: 480,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[400]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                  Column(
                    children: [
                      Text(
                          'Output:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                              'assets/images/biscuit.png',
                              width: 50,
                              height: 50,
                          ),
                          Text(
                              'x ${snapshot.data}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          );
        }
    );
  }
}
