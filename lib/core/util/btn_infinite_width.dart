import 'package:city_way/core/resource/font_manger.dart';
import 'package:flutter/material.dart';
import 'package:city_way/core/resource/color_manger.dart';

class Btn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  const Btn(
      {required this.text,
      required this.onPressed,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: AppColorManger.white,
              fontWeight: FontWeightManger.boldWeight,
              fontSize: FontSizeManger.fs18),
        ),
      ),
    );
  }
}
