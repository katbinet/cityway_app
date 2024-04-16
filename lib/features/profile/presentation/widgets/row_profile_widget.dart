import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const RowWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColorManger.secondaryAppColor,
            fontSize: FontSizeManger.fs18,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed: onPressed,
          color: AppColorManger.greyAppColor,
        )
      ],
    );
  }
}
