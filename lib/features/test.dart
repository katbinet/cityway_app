import 'dart:async';

import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/core/util/text_widget.dart';
import 'package:city_way/features/Auth/presentation/widgets/show_bottom_sheet_location.dart';
import 'package:city_way/features/common_container_shadow.dart';
import 'package:city_way/features/indicatior_widget.dart';
import 'package:city_way/features/points/presentation/widgets/points_widget.dart';
import 'package:city_way/features/service/domain/entities/categories.dart';
import 'package:flutter/material.dart';

//Build HomePage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Categories> categoriesList = [
    const Categories(serviceType: 'Smart', images: 'assets/image/sale1.jpg'),
    const Categories(serviceType: 'PPM', images: 'assets/image/sale2.jpg'),
    const Categories(serviceType: 'Plumbing', images: 'assets/image/sale3.jpg'),
    const Categories(serviceType: 'Smart', images: 'assets/image/sale2.jpg'),
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
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 4);
    timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % imageList.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void showModal() {
      showModalBottomSheet(
        //elevation: AppHeightManger.h2,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
        ),
        builder: (BuildContext context) {
          return const ShowBottomSheetLocation();
        },
      );
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorManger.backgroundAppColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColorManger.backgroundAppColor,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: AppHeightManger.h18points19,
            flexibleSpace: Stack(
              children: [
                Container(
                  width: size.width,
                  height: AppHeightManger.h18points19,
                  decoration: const BoxDecoration(
                    color: AppColorManger.mainAppColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: AppHeightManger.h14,
                    left: AppHeightManger.h2,
                    right: AppHeightManger.h2,
                  ),
                  child: ContainerShadowWidget(
                    myHeight: AppHeightManger.h7points5,
                    mywidth: AppWidthManger.w100,
                    myWidget: const PointWidget(numOfPoints: "500"),
                  ),
                ),
                Positioned(
                    top: AppHeightManger.h5,
                    left: AppHeightManger.h2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColorManger.white,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My location:",
                              style: TextStyle(color: AppColorManger.white),
                            ),
                            Text("Damas",
                                style: TextStyle(
                                    color: AppColorManger.white,
                                    fontWeight:
                                        FontWeightManger.semiBoldWeight)),
                          ],
                        ),
                        IconButton(
                            onPressed: showModal,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColorManger.white,
                            )),
                      ],
                    )),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h3,
                        left: AppHeightManger.h2,
                        right: AppHeightManger.h2,
                      ),
                      child: ContainerWidget(
                        isProfile: false,
                        myHeight: AppHeightManger.h18,
                        mywidth: AppHeightManger.h45,
                        myWidget: SizedBox(
                          height: AppHeightManger.h18,
                          child: PageView.builder(
                            controller: PageController(
                              initialPage: currentIndex ,
                              
                            ),
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
                                    imageList[currentIndex % imageList.length],
                                    fit: BoxFit.cover,
                                  ));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h1,
                        left: AppHeightManger.h04,
                      ),
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h6,
                        left: AppHeightManger.h2,
                      ),
                      child: TextWidget(
                          text: "What would you like to choose?",
                          fontsize: FontSizeManger.fs18,
                          isFontWeight: true,
                          myColor: AppColorManger.secondaryAppColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h2,
                        left: AppHeightManger.h2,
                        right: 0,
                      ),
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
                                padding:
                                    const EdgeInsets.all(AppPaddingManger.p3),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        height: AppHeightManger.h6,
                                        width: AppHeightManger.h6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColorManger.thirdAppColor,
                                        ),
                                        child: Image.asset(
                                          serviceList[index].images,
                                          color:
                                              AppColorManger.secondaryAppColor,
                                          scale: AppIconSizeManger.s05,
                                        )),
                                    Text(
                                      serviceList[index].serviceType,
                                      style: const TextStyle(
                                          color:
                                              AppColorManger.secondaryAppColor),
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h2,
                        left: AppHeightManger.h2,
                      ),
                      child: TextWidget(
                          text: "Offers",
                          fontsize: FontSizeManger.fs18,
                          isFontWeight: true,
                          myColor: AppColorManger.secondaryAppColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppHeightManger.h2,
                        left: AppHeightManger.h2,
                        right: 0,
                        bottom: AppHeightManger.h3,
                      ),
                      child: SizedBox(
                        height: AppHeightManger.h16,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          itemBuilder: (BuildContext context, int i) {
                            return ContainerWidget(
                              isProfile: false,
                              myHeight: AppHeightManger.h16,
                              mywidth: AppHeightManger.h12,
                              myWidget: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  categoriesList[i].images,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int i) {
                            return SizedBox(
                              width: size.width * 0.025,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
