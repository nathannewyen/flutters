import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      required this.fontWeight,
      this.height = 1.0});

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
