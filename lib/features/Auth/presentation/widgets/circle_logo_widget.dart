import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class CricleLogoWidget extends StatelessWidget {
  final String text;
  const CricleLogoWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.1)),
      ],
    );
  }
}
