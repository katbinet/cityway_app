import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/features/service/presentation/widgets/row_bill.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: false,
        onPressed: () {},
        title: "Orders",
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.04,
            right: size.width * 0.04,
            top: size.height * 0.02,
            bottom: size.height * 0.02),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.04, bottom: size.height * 0.02),
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
            ),
            ContainerWidget(
                isProfile: false,
                myHeight: size.height * 0.1,
                mywidth: size.width * 0.9,
                myWidget: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      top: size.width * 0.04,
                      right: size.width * 0.04),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order time",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "12/2/2024 11:40AM",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        "Change time",
                        style: TextStyle(
                            color: AppColorManger.mainAppColor, fontSize: 20),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.04, bottom: size.height * 0.02),
              child: ContainerWidget(
                  isProfile: false,
                  myHeight: size.height * 0.23,
                  mywidth: size.width * 0.9,
                  myWidget: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02,
                        right: size.width * 0.02,
                        top: size.height * 0.02,
                        bottom: size.height * 0.02),
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bill", style: TextStyle(fontSize: 20)),
                            Text("Payment way", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        RowBill(number: 2, paymentWay: "200 AED"),
                        RowBill(number: 2, paymentWay: "200 AED"),
                        Divider(color: AppColorManger.greyAppColor),
                        RowBill(
                          number: 4,
                          paymentWay: "400 AED",
                        ),
                      ],
                    ),
                  )),
            ),
            Btn(
                text: "Cancel order",
                onPressed: () {
                  Navigator.pushNamed(context, '/homeLayout');
                },
                color: AppColorManger.mainAppColor)
          ],
        ),
      ),
    );
  }
}
