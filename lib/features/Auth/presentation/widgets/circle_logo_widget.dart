import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:flutter/material.dart';


//! done all style & size & padding

class CricleLogoWidget extends StatelessWidget {
  final String text;
  const CricleLogoWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset("assets/image/auth/circle.png"),
            Image.asset("assets/image/logo.png"),
          ],
        ),
        Text(text,
            style: TextStyle(
                color: AppColorManger.secondaryAppColor,
                fontWeight: FontWeightManger.boldWeight,
                fontSize: FontSizeManger.fs24)),
      ],
    );
  }
}