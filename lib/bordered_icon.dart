import 'package:flutter/material.dart';
import 'circled_number.dart';

class BorderedIcon extends StatelessWidget {
  final String text; // rename to icon path once we get icon files
  final int value; // the value to display in the circle
  final Color borderColor;
  final double width;

  BorderedIcon(
      {required this.text,
      required this.value,
      required this.borderColor,
      required this.width});

  @override
  Widget build(BuildContext context) {
    double fontSize = 3 / 5 * width;
    double textCircleFraction = 6 / 9;
    double circleRadius = textCircleFraction * width / 2;
    double textCircleFontSize = textCircleFraction * fontSize;

    return Container(
      width: width + circleRadius,
      height: width + circleRadius,
      child: Stack(children: [
        Positioned(
          top: circleRadius,
          child: Container(
              width: width,
              height: width,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 2.0),
              ),
              alignment: Alignment.center,
              child: Text(
                text,
              )),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircledNumber(
            value: value,
            color: borderColor,
            radius: circleRadius,
          ),
        )
      ]),
    );
  }
}
