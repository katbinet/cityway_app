import 'dart:ui';

import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/core/util/text_widget.dart';
import 'package:city_way/features/payment/presentation/widgets/drop_down_menu_Item_widget.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isAccountCreated = false;
  String accountMessage = '';
  final List<String> options = ['Option1', 'Option2', 'Option3'];
  String selectedOption = 'Option1';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBarWidget(
            isArrowIcon: false,
            title: "Payment",
            onPressed: () {},
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                      text: "Payment method",
                      fontsize: 18,
                      myColor: AppColorManger.black,
                      isFontWeight: false),
                  DropDownMenuItemWidget(
                      options: options, selectedOption: selectedOption),
                  SizedBox(height: size.height * 0.05),
                  const TextWidget(
                      text: "Smart card",
                      fontsize: 18,
                      myColor: AppColorManger.black,
                      isFontWeight: false),
                  DropDownMenuItemWidget(
                      options: options, selectedOption: selectedOption),
                  SizedBox(height: size.height * 0.05),
                  const TextWidget(
                      text: "Amount",
                      fontsize: 18,
                      myColor: AppColorManger.black,
                      isFontWeight: false),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: DropDownMenuItemWidget(
                            options: options, selectedOption: selectedOption),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Btn(
                      text: "Pay",
                      onPressed: () {
                        setState(() {
                          isAccountCreated = true;
                          accountMessage = 'Your order submitted!';
                        });
                      },
                      color: AppColorManger.mainAppColor)
                ],
              ),
            ),
          ),
        ),
        if (isAccountCreated)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: AppColorManger.white.withOpacity(0.5),
            ),
          ),
        if (isAccountCreated)
          GestureDetector(
            onTap: (){
                      Navigator.pushNamed(context, '/homeLayout');
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImageIcon(
                    AssetImage('assets/image/submit.png'),
                    color: AppColorManger.mainAppColor,
                    size: 200,
                  ),
                  Text(
                    accountMessage,
                    style: const TextStyle(
                        color: AppColorManger.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
