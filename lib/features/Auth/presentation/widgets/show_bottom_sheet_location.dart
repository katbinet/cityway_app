import 'dart:ui';
import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/features/Auth/presentation/widgets/my_location_widget.dart';
import 'package:flutter/material.dart';

class ShowBottomSheetLocation extends StatelessWidget {
  const ShowBottomSheetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.035,
                left: size.height * 0.03,
                right: size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.03,
                  ),
                  child: const Center(
                    child: Text("My addresses",
                        style: TextStyle(
                            color: AppColorManger.secondaryAppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                ),
                const Location(
                    location: "بناء المحافظة- برزة",
                    detailsLocation: "برزة البلد مقابل الكلية العسكرية"),
                const Location(
                    location: "وزارة النفط", detailsLocation: 'شارع الباسل'),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.01),
                  child: Btn(
                      text: 'Add New location',
                      onPressed: () {
                        Navigator.pushNamed(context, '/mapSample');
                      },
                      color: AppColorManger.mainAppColor),
                )
              ],
            ),
          ),
        ));
  }
}
