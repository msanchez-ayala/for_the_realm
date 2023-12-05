import 'package:flutter/material.dart';

class CircledNumber extends StatelessWidget {
  final int value; // the value to display in the circle
  final Color color;
  final double radius;

  CircledNumber(
      {required this.value, required this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    double fontSize = radius;

    return Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          value.toString(),
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ));
  }
}
