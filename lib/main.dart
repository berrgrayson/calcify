// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calculator_screen.dart';
import 'models/calc_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalcState(),
      child: CalcifyApp(),
    ),
  );
}

class CalcifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}
