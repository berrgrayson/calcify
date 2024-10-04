// lib/widgets/calc_button.dart
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color? color; // Optional color parameter

  CalcButton({required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: color ?? Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
