import 'package:flutter/material.dart';

class BorderedIcon extends StatelessWidget {
  final String text; // rename to icon path once we get icon files
  final Color borderColor;
  final double width;
  final double fontSize;

  BorderedIcon(
      {required this.text,
      required this.borderColor,
      required this.width,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2.0),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
        ));
  }
}
