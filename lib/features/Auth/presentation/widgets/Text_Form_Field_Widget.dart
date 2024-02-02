import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/enum.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String name;
  final IconData icon;
  final FieldType type;
  const TextFormFieldWidget({
    required this.controller,
    required this.name,
    super.key, required this.type, required this.icon,
  }
  );

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool isPasswordType = widget.type == FieldType.password;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: size.height*0.01, horizontal: size.width*0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: widget.controller,
            validator: (val) =>
                val!.isEmpty ? "${widget.name} Can't be empty" : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColorManger.fillFieldColor,
              prefixIcon: Icon(widget.icon),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(color: AppColorManger.borderFieldColor)),
              suffixIcon: isPasswordType
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        
                      },
                    )
                  : null,
                  
            ),
          ),
        
        ],
      ),
    );
  }
}
