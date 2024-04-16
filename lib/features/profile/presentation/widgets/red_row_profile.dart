import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:flutter/material.dart';

class RedRowWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const RedRowWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColorManger.mainAppColor,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColorManger.mainAppColor,
            fontSize: FontSizeManger.fs18,
            fontWeight: FontWeightManger.boldWeight,
          ),
        ),
      ],
    );
  }
}
