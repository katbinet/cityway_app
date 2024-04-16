import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class ContainerShadowWidget extends StatelessWidget {
  final double myHeight;
  final double mywidth;
  final Widget myWidget;

  const ContainerShadowWidget(
      {super.key,
      required this.myHeight,
      required this.mywidth,
      required this.myWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mywidth,
      height: myHeight,
      decoration: BoxDecoration(
        color: AppColorManger.white,
        boxShadow: [
          BoxShadow(
            color: AppColorManger.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: myWidget,
    );
  }
}
