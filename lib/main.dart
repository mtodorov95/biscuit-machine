import 'package:biscuits/pages/HomePage.dart';
import 'package:flutter/material.dart';

// TODO: Extract interfaces where you can
// TODO: Control flow for machine states i.e. can't pause if off
// TODO: Get machine data properly
// TODO: Cool oven back to 0 when off


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Biscuit Machine Testing'),
    );
  }
}

