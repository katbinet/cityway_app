import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:flutter/material.dart';

class PointWidget extends StatefulWidget {
  final String numOfPoints;
  const PointWidget({super.key, required this.numOfPoints});

  @override
  State<PointWidget> createState() => _PointWidgetState();
}

class _PointWidgetState extends State<PointWidget> {
  @override
  Widget build(BuildContext context) {
    //double currentSliderValue = 500;
    return Padding(
      padding: const EdgeInsets.all(AppPaddingManger.p14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/image/logo.png"),
          Column(
            children: [
              Text(
                "Loyalty Store",
                style: TextStyle(
                    color: AppColorManger.secondaryAppColor,
                    fontSize: FontSizeManger.fs18,
                    fontWeight: FontWeightManger.boldWeight),
              ),
              /*Slider(
              value: currentSliderValue,
              max: 1000,
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                });
              },
            )*/
            ],
          ),
          Column(
            children: [
              //Image.asset("assets/image/money.png"),
              Text(
                "${widget.numOfPoints} Points",
                style: const TextStyle(color: AppColorManger.mainAppColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
