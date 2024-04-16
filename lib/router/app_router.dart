import 'package:city_way/core/navigation/fade_builder_route.dart';
import 'package:city_way/core/page/not_found_page.dart';
import 'package:city_way/features/Auth/presentation/pages/SignIn/signin_page.dart';
import 'package:city_way/features/Auth/presentation/pages/SignUp/Confirm_Page.dart';
import 'package:city_way/features/Auth/presentation/pages/SignUp/signup_page.dart';
import 'package:city_way/features/home_layout.dart';
import 'package:city_way/features/home_screen.dart';
import 'package:city_way/features/payment/presentation/pages/payment.dart';
import 'package:city_way/features/points/presentation/pages/points.dart';
import 'package:city_way/features/profile/presentation/pages/enter_location.dart';
import 'package:city_way/features/profile/presentation/pages/profile_screen.dart';
import 'package:city_way/features/service/presentation/pages/booking_screen.dart';
import 'package:city_way/features/service/presentation/pages/categories_screen.dart';
import 'package:city_way/features/service/presentation/pages/item_category_page.dart';
import 'package:city_way/features/service/presentation/pages/order.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    //final argument = settings.arguments;
    switch (settings.name) {
      //Splash
      // case RouteNamedScreens.splashNameRoutePage:
      // return FadeBuilderRoute(page: const SplashScreen());

      //!Auth
      //Login
      case RouteNamedScreens.signinNameRoutePage:
        return FadeBuilderRoute(page: const SignInPage());
      //Signup
      case RouteNamedScreens.signupNameRoutePage:
        return FadeBuilderRoute(page: const SignUpPage());
      //Confirm Account
      case RouteNamedScreens.confirmAccountNameRoutePage:
        return FadeBuilderRoute(page: ConfirmPage());
      //Map
      case RouteNamedScreens.mapSample:
        return FadeBuilderRoute(page: const MapSample());

      //HomeLayout
      case RouteNamedScreens.homeLayoutNameRoutePage:
        return FadeBuilderRoute(page: const HomeLayout());
      //HomePage
      case RouteNamedScreens.homePageNameRoutePage:
        return FadeBuilderRoute(page: const HomeScreen());

      //Payment
      case RouteNamedScreens.paymentNameRoutePage:
        return FadeBuilderRoute(page: const Payment());

      //Points
      case RouteNamedScreens.pointsNameRoutepage:
        return FadeBuilderRoute(page: const Points());

      //Points
      case RouteNamedScreens.profileNameRoutepage:
        return FadeBuilderRoute(page: const ProfilePage());

      //BookingPage
      case RouteNamedScreens.bookingNameRoutepage:
        return FadeBuilderRoute(page: const BookingPage());

      //Categories
      case RouteNamedScreens.categoriesNameRoutepage:
        return FadeBuilderRoute(page: const CategoriesPage());

      //Item Categories
      case RouteNamedScreens.itemCategoriesNameRoutepage:
        return FadeBuilderRoute(page: const ItemCategoryPage());

      //Order
      case RouteNamedScreens.orderNameRoutepage:
        return FadeBuilderRoute(page: const Order());

      //Deafult Page To Handel Routing Failure
      default:
        return FadeBuilderRoute(page: const NotFoundPage());
    }
  }
}

class RouteNamedScreens {
  // Routing Naming Class
  //static const String splashNameRoutePage = '/';
  static const String signinNameRoutePage = '/signin';
  static const String signupNameRoutePage = '/signup';
  static const String confirmAccountNameRoutePage = '/confirmAccount';
  static const String homeLayoutNameRoutePage = '/';
  static const String homePageNameRoutePage = '/homePage';
  static const String paymentNameRoutePage = '/payment';
  static const String pointsNameRoutepage = '/points';
  static const String profileNameRoutepage = '/profile';
  static const String bookingNameRoutepage = '/booking';
  static const String categoriesNameRoutepage = '/categories';
  static const String itemCategoriesNameRoutepage = '/itemCategories';
  static const String orderNameRoutepage = '/order';
  static const String mapSample = '/mapSample';
}
