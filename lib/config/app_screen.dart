import 'package:flutter_moon/config/app_routes.dart';
import 'package:flutter_moon/modules/home_screen/screen/Home_Screen.dart';
import 'package:flutter_moon/modules/splash_screen/screen/Splash_Screen.dart';
import 'package:get/get.dart';

class AppScreens {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () => const HomeScreen(),
    ),
  ];
}
