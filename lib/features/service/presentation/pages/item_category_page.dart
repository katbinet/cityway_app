import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/btn_infinite_width.dart';
import 'package:city_way/features/payment/presentation/widgets/drop_down_menu_item_widget.dart';
import 'package:flutter/material.dart';

class ItemCategoryPage extends StatefulWidget {
  const ItemCategoryPage({super.key});

  @override
  State<ItemCategoryPage> createState() => _ItemCategoryPageState();
}

class _ItemCategoryPageState extends State<ItemCategoryPage> {
  List<String> options = [
    'Option1',
    'Option2',
    'Option3',
  ];
  String? selectedOption = 'Option1';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: false,
        title: "Soft services",
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: const AssetImage('assets/image/Plumbing1.png'),
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.height * 0.01),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("XXX",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text("2000 AED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: const Text("Select Facility type:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    DropDownMenuItemWidget(
                        options: options, selectedOption: selectedOption),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: const Text("Select service type:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    DropDownMenuItemWidget(
                        options: options, selectedOption: selectedOption),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: const Text("Details:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColorManger.fillFieldColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColorManger.borderFieldColor)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Btn(
                          text: 'Submit',
                          onPressed: () {
                            Navigator.pushNamed(context, '/payment');
                          },
                          color: AppColorManger.mainAppColor),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
