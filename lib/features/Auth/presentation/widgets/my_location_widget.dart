import 'package:city_way/core/resource/font_manger.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/color_manger.dart';

class Location extends StatelessWidget {
  final String location;
  final String detailsLocation;
  const Location({super.key, required this.location, required this.detailsLocation});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColorManger.greyAppColor,
          ),
          Column(
            children: [
              Text(location,
                  style: TextStyle(
                      fontSize: FontSizeManger.fs16,
                      color: AppColorManger.secondaryAppColor)),
              Text(detailsLocation,
                  style: TextStyle(
                      fontSize: FontSizeManger.fs14,
                      color: AppColorManger.secondaryAppColor)),
            ],
          ),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ImageIcon(AssetImage('assets/image/delete.png'),
                  color: AppColorManger.mainAppColor),
              SizedBox(width: size.width * 0.05),
              const ImageIcon(AssetImage('assets/image/edit.png'),
                  color: AppColorManger.secondaryAppColor),
            ],
          ),*/
        ],
      ),
    );
  }
}
