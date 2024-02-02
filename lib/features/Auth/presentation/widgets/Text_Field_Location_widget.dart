import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

class TextFieldLocationWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool big;
  const TextFieldLocationWidget(
      {super.key,
      required this.controller,
      required this.name,
      required this.big});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.01),
      child: TextFormField(
        maxLines: big ? 3 : 1,
        maxLength: 3,
        controller: controller,
        validator: (val) => val!.isEmpty ? "$name Can't be empty" : null,
        decoration: InputDecoration(
          hintText: name,
          filled: true,
          fillColor: AppColorManger.fillFieldColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                  borderSide:const BorderSide(color: AppColorManger.borderFieldColor)),
        ),
      ),
    );
  }
}
