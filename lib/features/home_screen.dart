import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/core/util/text_widget.dart';
import 'package:city_way/features/common_container_shadow.dart';
import 'package:city_way/features/indicatior_widget.dart';
import 'package:city_way/features/points/presentation/widgets/points_widget.dart';
import 'package:city_way/features/service/domain/entities/categories.dart';
import 'package:flutter/material.dart';

//Build HomePage

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Categories> categoriesList = [
    const Categories(
        serviceType: 'Smart', images: 'assets/image/Smart_operations.png'),
    const Categories(
        serviceType: 'PPM', images: 'assets/image/PPM_services.png'),
    const Categories(
        serviceType: 'Plumbing', images: 'assets/image/Plumbing.png'),
  ];
  final List<Categories> serviceList = [
    const Categories(
        serviceType: 'Smart',
        images: 'assets/image/top_services/top_services1.png'),
    const Categories(
        serviceType: 'PPM',
        images: 'assets/image/top_services/top_services2.png'),
    const Categories(
        serviceType: 'Plumbing',
        images: 'assets/image/top_services/top_services3.png'),
    const Categories(
        serviceType: 'Smart',
        images: 'assets/image/top_services/top_services1.png'),
    const Categories(
        serviceType: 'PPM',
        images: 'assets/image/top_services/top_services2.png'),
    const Categories(
        serviceType: 'Plumbing',
        images: 'assets/image/top_services/top_services3.png'),
  ];
  final List<String> imageList = [
    'assets/image/slider1.webp',
    'assets/image/slider2.webp',
    'assets/image/slider4.jpg',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColorManger.backgroundAppColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // background red container
              Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  height: AppHeightManger.h18points19,
                  decoration: const BoxDecoration(
                    color: AppColorManger.mainAppColor,
                  ),
                ),
              ),

              // Points widget
              Positioned(
                top: AppHeightManger.h14,
                left: AppHeightManger.h2,
                right: AppHeightManger.h2,
                child: ContainerShadowWidget(
                  myHeight: AppHeightManger.h7points5,
                  mywidth: AppWidthManger.w1,
                  myWidget: const PointWidget(numOfPoints: "500"),
                ),
              ),

              //New services
              /*Positioned(
            top: size.height * 0.26,
            left: size.width * 0.05,
            child: const TextWidget(
                text: "New services",
                fontsize: 20,
                isFontWeight: true,
                myColor: AppColorManger.secondaryAppColor),
          ),
          */

              //TODO: Slider
              //Slider widget
              Positioned(
                top: AppHeightManger.h25,
                left: AppHeightManger.h2,
                right: AppHeightManger.h2,
                child: ContainerWidget(
                  isProfile: false,
                  myHeight: AppHeightManger.h18,
                  mywidth: AppHeightManger.h01,
                  myWidget: SizedBox(
                    height: AppHeightManger.h18,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageList[index % imageList.length],
                              fit: BoxFit.cover,
                            ));
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppHeightManger.h44,
                left: AppHeightManger.h22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < imageList.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: IndecatorWidget(
                          isSelected: currentIndex == i,
                        ),
                      )
                  ],
                ),
              ),

              //Top services
              Positioned(
                top: AppHeightManger.h49,
                left: AppHeightManger.h2,
                child: TextWidget(
                    text: "What would you like to choose?",
                    fontsize: FontSizeManger.fs18,
                    isFontWeight: true,
                    myColor: AppColorManger.secondaryAppColor),
              ),

              Positioned(
                top: AppHeightManger.h55,
                left: AppHeightManger.h2,
                right: 0,
                child: SizedBox(
                  height: AppHeightManger.h10,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: serviceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContainerWidget(
                        isProfile: false,
                        myHeight: AppHeightManger.h10,
                        mywidth: AppHeightManger.h10,
                        myWidget: Padding(
                          padding: const EdgeInsets.all(AppPaddingManger.p3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: AppHeightManger.h6,
                                  width: AppHeightManger.h6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColorManger.thirdAppColor,
                                  ),
                                  child: Image.asset(
                                    serviceList[index].images,
                                    color: AppColorManger.secondaryAppColor,
                                    scale: AppIconSizeManger.s05,
                                  )),
                              Text(
                                serviceList[index].serviceType,
                                style: const TextStyle(
                                    color: AppColorManger.secondaryAppColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: size.width * 0.025,
                      );
                    },
                  ),
                ),
              ),

              //List of offers
              Positioned(
                top: AppHeightManger.h68,
                left: AppHeightManger.h2,
                child: TextWidget(
                    text: "Offers",
                    fontsize: FontSizeManger.fs18,
                    isFontWeight: true,
                    myColor: AppColorManger.secondaryAppColor),
              ),
              Positioned(
                bottom: size.height * 0.01,
                top: size.height * 0.74,
                left: 0,
                right: 0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: ContainerWidget(
                            isProfile: false,
                            myHeight: size.height * 0.5,
                            mywidth: size.width * 0.4,
                            myWidget: Image.asset(
                              categoriesList[index].images,
                              fit: BoxFit.cover,
                            )));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: size.width * 0.05,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
