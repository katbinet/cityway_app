import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btnInfiniteWidth.dart';
import 'package:city_way/features/Auth/presentation/pages/SignIn/SignIn_Page.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Field_Location_widget.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatelessWidget {
  final TextEditingController _loactionController = TextEditingController();
  final TextEditingController _streeController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _detialscontroller = TextEditingController();
  ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30,left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldLocationWidget(
            controller: _loactionController,
            name: "Location name ex: (home)",
            big: false,
          ),
          TextFieldLocationWidget(
            controller: _streeController,
            name: "Street (autofill)",
            big: false,
          ),
          TextFieldLocationWidget(
            controller: _floorController,
            name: "Floor",
            big: false,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8,bottom: 25),
            child: Text("Property type:",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    width: 160,
                    height: 80,
                    decoration: BoxDecoration(
                        color: AppColorManger.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // تحديد اتجاه الظل
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.home_outlined,
                        color: AppColorManger.mainAppColor, size: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text("House"),
                  ),
                ],
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 160,
                    height: 80,
                    decoration: BoxDecoration(
                        color: AppColorManger.mainAppColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // تحديد اتجاه الظل
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.villa_outlined,
                        color: AppColorManger.white, size: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top:10),
                    child: Text("Villa"),
                  ),
                ],
              )
            ],
          ),
          TextFieldLocationWidget(
            controller: _detialscontroller,
            name: 'Details',
            big: true,
          ),
          Btn(
              text: 'Confirm',
              onPressed: () {
                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                );
              },
              color: AppColorManger.mainAppColor)
        ],
      ),
    );
  }
}
