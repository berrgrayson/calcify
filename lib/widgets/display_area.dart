// lib/widgets/display_area.dart
import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  final String equation;
  final String result;

  DisplayArea({required this.equation, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: Text(
            equation,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(fontSize: 32, color: Colors.greenAccent),
          ),
        ),
      ],
    );
  }
}
