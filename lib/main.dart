import 'package:biscuits/pages/HomePage.dart';
import 'package:biscuits/services/MachineProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: Extract interfaces where you can
// TODO: Improve the UI
// TODO: Cool oven back to 0 when off


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => MachineProvider(),
      child: MaterialApp(
        home: HomePage(title: 'Biscuit Machine Testing'),
      ),
    );
  }
}

