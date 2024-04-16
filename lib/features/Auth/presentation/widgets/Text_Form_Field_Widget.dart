import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/theme/app_theme.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:flutter/material.dart';


//! done Padding...

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final IconData icon;
  final FieldType type;
  const TextFormFieldWidget({
    required this.controller,
    required this.name,
    super.key,
    required this.type,
    required this.icon,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool isPasswordType = widget.type == FieldType.password;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPaddingManger.p8, horizontal: AppPaddingManger.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name, style: appTextTheme.headlineMedium),
          TextFormField(
            controller: widget.controller,
            validator: (val) =>
                val!.isEmpty ? "${widget.name} Can't be empty" : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColorManger.fillFieldColor,
              prefixIcon: Icon(widget.icon),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: AppColorManger.borderFieldColor)),
              suffixIcon: isPasswordType
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
