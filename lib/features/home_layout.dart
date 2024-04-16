import 'package:city_way/core/resource/color_manger.dart';
import 'package:city_way/features/service/presentation/pages/booking_screen.dart';
import 'package:city_way/features/service/presentation/pages/categories_screen.dart';
import 'package:city_way/features/profile/presentation/pages/profile_screen.dart';
import 'package:city_way/features/test.dart';
import 'package:flutter/material.dart';

//layout screen for navigaor between the pages
//using: BottomNavigationBar
class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const BookingPage(),
    const CategoriesPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/navbar/dashboard.png")),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/navbar/booking.png")),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/navbar/categories.png")),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/image/navbar/person.png")),
            label: "Profile",
          ),
        ],
        selectedItemColor: AppColorManger.mainAppColor,
      ),
    );
  }
}
