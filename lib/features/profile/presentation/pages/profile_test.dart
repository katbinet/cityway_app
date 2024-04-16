import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/util/appbar.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/features/profile/presentation/widgets/row_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        isArrowIcon: false,
        title: "Profile",
        onPressed: () {},
      ),
      body: Stack(children: [
        Positioned(
            top: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: ContainerWidget(
                                isProfile: true,

              myHeight: size.height * 0.1,
              mywidth: size.width * 0.9,
              myWidget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/image/Profile.png"),
                            radius: 30),
                      ),
                      Positioned(
                        right: size.height * 0.02,
                        bottom: size.height * 0.02,
                        child: ImageIcon(
                          const AssetImage("assets/image/edit.png"),
                          color: AppColorManger.mainAppColor,
                          size: size.height * 0.022,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.06),
                    child: const Text("User name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )),
        Positioned(
            top: size.height * 0.18,
            left: size.width * 0.05,
            right: size.width * 0.05,
            child: ContainerWidget(
              isProfile: true,
              myHeight: size.width * 0.7,
              mywidth: size.height * 0.3,
              myWidget: Padding(
                padding: EdgeInsets.all(size.height * 0.015),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RowWidget(text: 'Switch language', onPressed: () {}),
                      RowWidget(
                          text: 'Points',
                          onPressed: () {
                            Navigator.pushNamed(context, '/points');
                          }),
                      RowWidget(text: 'My locations', onPressed: () {}),
                      RowWidget(text: 'Log out', onPressed: () {}),
                    ]),
              ),
            )),
      ]),
    );
  }
}
