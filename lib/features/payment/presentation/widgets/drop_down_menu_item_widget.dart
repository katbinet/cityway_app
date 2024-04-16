import 'package:city_way/core/resource/color_manger.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownMenuItemWidget extends StatefulWidget {
  final List<String> options;
  String? selectedOption;

  DropDownMenuItemWidget(
      {super.key, required this.options, required this.selectedOption});

  @override
  State<DropDownMenuItemWidget> createState() =>
      __DropDownMenuItemWidgetState();
}

class __DropDownMenuItemWidgetState extends State<DropDownMenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColorManger.borderFieldColor))),
      value: widget.selectedOption,
      onChanged: (newValue) {
        setState(() {
          widget.selectedOption = newValue;
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
