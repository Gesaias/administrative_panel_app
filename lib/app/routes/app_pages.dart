import 'package:administrative_panel_app/app/modules/home/views/home.view.dart';
import 'package:administrative_panel_app/app/modules/login/views/login.view.dart';
import 'package:get/get.dart';

import '../modules/authentication/authentication.binding.dart';
import '../modules/home/home.binding.dart';
import '../modules/login/login.binding.dart';
import '../modules/splash/splash.binding.dart';
import '../modules/splash/views/splash.view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    // Splash Screen
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      bindings: [
        AuthenticationBinding(),
        SplashBinding(),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

