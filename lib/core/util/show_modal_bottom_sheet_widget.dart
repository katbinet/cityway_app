import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/features/profile/presentation/widgets/property_type_widget.dart';
import 'package:city_way/features/profile/presentation/widgets/text_field_location_widget.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatefulWidget {
  //final _formKey = GlobalKey<FormState>();
  //final TextEditingController _loactionController = TextEditingController();
  //final TextEditingController _streeController = TextEditingController();
  //final TextEditingController _floorController = TextEditingController();
  //final TextEditingController _detialscontroller = TextEditingController();
  const ShowModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}

class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Color redColor = AppColorManger.mainAppColor;
    Color whiteColor = AppColorManger.white;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.035,
          left: size.height * 0.012,
          right: size.height * 0.012),
      child: Form(
        //    key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextFieldLocationWidget(
              //controller: _loactionController,
              name: "Location name ex: (home)",
              big: false,
            ),
            const TextFieldLocationWidget(
              //controller: _streeController,
              name: "Street (autofill)",
              big: false,
            ),
            const TextFieldLocationWidget(
              //controller: _floorController,
              name: "Floor",
              big: false,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.012, bottom: size.height * 0.03),
              child: const Text("Property type:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PropertyType(
                  icon: const Icon(Icons.home_outlined, size: 50),
                  backgroundColor: whiteColor,
                  iconColor: redColor,
                  text: 'House',
                  onPressed: () {
                    setState(() {
                      redColor = AppColorManger.white;
                    whiteColor = AppColorManger.mainAppColor;
                    });
                  },
                ),
                PropertyType(
                  icon: const Icon(Icons.villa, size: 50),
                  backgroundColor: redColor,
                  iconColor: whiteColor,
                  text: 'Villa',
                  onPressed: () {
                    setState(() {
                      redColor = AppColorManger.white;
                      whiteColor = AppColorManger.mainAppColor;
                    });
                  },
                ),
              ],
            ),
            const TextFieldLocationWidget(
              //controller: _detialscontroller,
              name: 'Details',
              big: true,
            ),
            Btn(
                text: 'Confirm',
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                color: AppColorManger.mainAppColor)
          ],
        ),
      ),
    );
  }
}
