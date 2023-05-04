import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home.view.dart';
import '../../login/views/login.view.dart';
import '../controllers/splash.controller.dart';

class OnBoard extends GetWidget<SplashController> {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLogged ? HomeView() : LoginView();
    });
  }
}
