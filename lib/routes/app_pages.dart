

import 'package:get/get.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/Create%20Data/new_post_screen.dart';
import 'package:implementation_panel/Screens/Dashboard/Sample/list_screen.dart';
import 'package:implementation_panel/Screens/Login/login_screen.dart';
import 'package:implementation_panel/Screens/illustration/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const LoginView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.dashboardView,
      page: () =>  HomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.listScreen,
      page: () => const ListScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
