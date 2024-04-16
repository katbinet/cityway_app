import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double myHeight;
  final double mywidth;
  final Widget myWidget;
  final bool isProfile;

  const ContainerWidget(
      {super.key,
      required this.myHeight,
      required this.mywidth,
      required this.myWidget,
      required this.isProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mywidth,
      height: myHeight,
      decoration: BoxDecoration(
        color: AppColorManger.white,
        borderRadius:
            isProfile ? BorderRadius.circular(0) : BorderRadius.circular(10),
      ),
      child: myWidget,
    );
  }
}
