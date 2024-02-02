import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/btnInfiniteWidth.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:city_way/features/Auth/presentation/widgets/Text_Form_Field_Widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/circle_logo_widget.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CricleLogoWidget(text: 'Confirm account'),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Enter the code sent to your number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 40),
                      child: TextFormFieldWidget(
                        controller: _codeController,
                        name: 'Code',
                        icon: const IconData(0),
                        type: FieldType.text,
                      ),
                    ),
                    Btn(
                      onPressed: _confirm,
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

void _confirm() {}
