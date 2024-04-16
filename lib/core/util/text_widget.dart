import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color myColor;
  final double fontsize;
  final bool isFontWeight; 
  const TextWidget({super.key, required this.text, required this.myColor, required this.fontsize, required this.isFontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize,color: myColor, fontWeight: isFontWeight? FontWeight.bold : null),
    );
  }
}
