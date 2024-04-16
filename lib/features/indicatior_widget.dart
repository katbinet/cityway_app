import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class IndecatorWidget extends StatelessWidget {
  final bool isSelected;
  const IndecatorWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSelected ? 5 : 4,
      width: isSelected ? 5 : 4,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColorManger.mainAppColor
              : AppColorManger.thirdAppColor),
    );
  }
}
