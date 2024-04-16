import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class ItemGridWidget extends StatelessWidget {
  final String serviceType;
  final String images;
  final int? numOfPoints;
  final double myWidth;
  final double myHeight;
  final bool isPoint;

  const ItemGridWidget({
    super.key,
    required this.serviceType,
    required this.images,
    required this.numOfPoints,
    required this.myHeight,
    required this.myWidth,
    required this.isPoint,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.04,
        right: size.width * 0.04,
        top: size.height * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: myHeight,
            width: myWidth,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            serviceType,
            style: const TextStyle(
                color: AppColorManger.secondaryAppColor,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade),
          ),
          isPoint
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Price"),
                    Text(
                      "$numOfPoints points",
                      style: const TextStyle(
                          color: AppColorManger.mainAppColor,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
