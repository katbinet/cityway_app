import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/grid_widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/show_bottom_sheet_location.dart';
import 'package:city_way/features/service/domain/entities/categories.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Categories> _categoriesList = const [
    Categories(
        serviceType: 'Smart operations',
        images: 'assets/image/Smart_operations.png'),
    Categories(
        serviceType: 'PPM services', images: 'assets/image/PPM_services.png'),
    Categories(serviceType: 'Plumbing', images: 'assets/image/Plumbing.png'),
  ];
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    void showModal() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const ShowBottomSheetLocation();
        },
      );
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: true,
        title: "Location",
        onPressed: showModal,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04),
          child: Container(
            decoration: BoxDecoration(
              color: AppColorManger.fillFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.search, color: AppColorManger.greyAppColor),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(color: AppColorManger.greyAppColor),
              ),
            ),
          ),
        ),
        GridViewWidget(
          //childAspectRatio: size.height*0.001,
          childAspectRatio: size.width * 0.002,
          //childAspectRatio: 0.8,
          isPoint: false,
          myList: _categoriesList,
          onTap: () {
            Navigator.pushNamed(context, '/itemCategories');
          },
        ),
      ]),
    );
  }
}
