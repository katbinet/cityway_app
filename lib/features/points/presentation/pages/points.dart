import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/core/util/grid_widget.dart';
import 'package:city_way/features/points/domain/entities/point.dart';
import 'package:city_way/features/points/presentation/widgets/points_widget.dart';
import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  final List _list = const [
    Point(
      images: "assets/image/Smart_operations.png",
      serviceType: "Sink fix",
      numOfPoints: 15,
    ),
    Point(
      images: "assets/image/PPM_services.png",
      serviceType: "Roof fix",
      numOfPoints: 25,
    ),
  ];
  const Points({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: false,
        title: "Points",
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Positioned(
                  top: size.height * 0.14,
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  child: ContainerWidget(
                                      isProfile: false,

                    myHeight: size.height * 0.1,
                    mywidth: size.width * 0.9,
                    myWidget: const PointWidget(numOfPoints: "20"),
                  )),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.03,
                  left: size.width * 0.01,
                ),
                child: const Text("Offers",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              GridViewWidget(
                childAspectRatio: size.height * 0.00115,
                isPoint: true,
                myList: _list,
                onTap: () {},
              ),
            ]),
      ),
    );
  }
}
