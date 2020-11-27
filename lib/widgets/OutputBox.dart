import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MachineProvider>(context);
    return StreamBuilder<int>(
        stream: provider.output,
        builder: (context, snapshot) {
          return Container(
            color: Colors.grey[400],
              width: 240,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Output:',
                  ),
                  Text(
                    '${snapshot.data}'
                  ),
                ],
              ),
          );
        }
    );
  }
}
