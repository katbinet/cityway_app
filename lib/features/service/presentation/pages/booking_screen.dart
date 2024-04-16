import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: false,
        onPressed: () {},
        title: "Orders",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.08,
                right: size.width * 0.08,
                bottom: size.height * 0.04),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Workshops",
                  style: TextStyle(
                      color: AppColorManger.mainAppColor, fontSize: 20),
                ),
                Text("Products",
                    style: TextStyle(
                        color: AppColorManger.greyAppColor, fontSize: 20)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/order');
            },
            child: ContainerWidget(
                isProfile: false,
                myHeight: size.height * 0.1,
                mywidth: size.width * 0.9,
                myWidget: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, right: size.width * 0.04),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order num",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Confirmed",
                        style: TextStyle(
                            color: AppColorManger.mainAppColor, fontSize: 20),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
