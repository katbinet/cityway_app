import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/circle_logo_widget.dart';
import 'package:flutter/material.dart';


//! done style & padding & size

class ConfirmPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CricleLogoWidget(text: 'Confirm account'),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPaddingManger.p40,
                  left: AppPaddingManger.p10,
                  right:  AppPaddingManger.p10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Text(
                      'Enter the code sent to your number',
                      style: TextStyle(
                        fontWeight: FontWeightManger.boldWeight,
                        fontSize: FontSizeManger.fs18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppPaddingManger.p30 , bottom: AppPaddingManger.p40),
                      child: TextFormFieldWidget(
                        controller: _codeController,
                        name: 'Code',
                        icon: const IconData(0),
                        type: FieldType.text,
                      ),
                    ),
                    Btn(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homeLayout');
                      },
                      text: 'Confirm',
                      color: AppColorManger.mainAppColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ])),
    );
  }
}

//void _confirm() {}
