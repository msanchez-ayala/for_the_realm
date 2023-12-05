import 'package:flutter/material.dart';

class TextWithBackground extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final double width;

  TextWithBackground(
      {required this.text,
      required this.backgroundColor,
      required this.fontSize,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ));
  }
}
