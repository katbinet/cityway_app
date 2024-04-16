import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class PropertyType extends StatelessWidget {
  final Icon icon;
  final Color iconColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;
  const PropertyType(
      {required this.icon,
      required this.iconColor,
      required this.backgroundColor,
      required this.text,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size.width * 0.4,
            height: size.height * 0.1,
            decoration: BoxDecoration(
              color: backgroundColor,
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
            child:
                //icon,
                Icon(Icons.home_outlined, color: iconColor, size: 50),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Text(text),
        ),
      ],
    );
  }
}
