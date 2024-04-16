import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/core/resource/font_manger.dart';
import 'package:city_way/core/resource/size_manger.dart';
import 'package:city_way/core/util/common_container.dart';
import 'package:city_way/features/profile/presentation/widgets/red_row_profile.dart';
import 'package:city_way/features/profile/presentation/widgets/row_profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorManger.backgroundAppColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppPaddingManger.p25),
            child: ContainerWidget(
              isProfile: true,
              myHeight: AppHeightManger.h10,
              mywidth: AppWidthManger.w100,
              myWidget: Center(
                child: Text(
                  'Rita',
                  style: TextStyle(
                      color: AppColorManger.secondaryAppColor,
                      fontWeight: FontWeightManger.boldWeight,
                      fontSize: FontSizeManger.fs17),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddingManger.p14),
            child: ContainerWidget(
              isProfile: true,
              myHeight: AppHeightManger.h6oint5,
              mywidth: AppWidthManger.w100,
              myWidget: Padding(
                  padding: const EdgeInsets.only(left: AppPaddingManger.p18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RedRowWidget(
                          text: "Edit My Profile",
                          icon: Icons.person_2_rounded),
                      IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () {},
                        color: AppColorManger.greyAppColor,
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddingManger.p12),
            child: ContainerWidget(
              isProfile: true,
              myHeight: AppHeightManger.h28,
              mywidth: AppWidthManger.w100,
              myWidget: Padding(
                padding: const EdgeInsets.only(
                    left: AppPaddingManger.p18, top: AppPaddingManger.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        RedRowWidget(
                            text: "Account Details", icon: Icons.account_circle)
                      ],
                    ),
                    RowWidget(text: "My Service", onPressed: () {}),
                    SizedBox(
                        width: AppWidthManger.w90,
                        child: const Divider(
                          color: AppColorManger.backgroundAppColor,
                        )),
                    RowWidget(text: "My Addresses", onPressed: () {}),
                    SizedBox(
                        width: AppWidthManger.w90,
                        child: const Divider(
                          color: AppColorManger.backgroundAppColor,
                        )),
                    RowWidget(text: "Favorites", onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddingManger.p10),
            child: ContainerWidget(
                isProfile: true,
                myHeight: AppHeightManger.h14,
                mywidth: AppWidthManger.w100,
                myWidget: Padding(
                  padding: const EdgeInsets.only(
                      left: AppPaddingManger.p18, top: AppPaddingManger.p8),
                  child: Column(
                    children: [
                      const RedRowWidget(
                        icon: Icons.settings,
                        text: "Settings",
                      ),
                      SizedBox(
                          width: AppWidthManger.w90,
                          child: const Divider(
                            color: AppColorManger.backgroundAppColor,
                          )),
                      RowWidget(text: "Language", onPressed: () {}),
                    ],
                  ),
                )),
          )
        ],
      )),
    );
  }
}
