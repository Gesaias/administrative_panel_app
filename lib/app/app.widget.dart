import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/themes/app_theme.dart';
import 'modules/authentication/authentication.binding.dart';
import 'routes/app_pages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Recepção Prefeitura Municipal de Jaru",
      theme: AppThemes.themData,
      defaultTransition: Transition.fadeIn,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: AuthenticationBinding(),
    );
  }
}
