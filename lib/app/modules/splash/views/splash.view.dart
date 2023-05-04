import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash.controller.dart';
import '../widgets/error.widget.dart';
import '../widgets/on_board.widget.dart';
import '../widgets/waiting.widget.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initializeSettings(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashWaitingWidget(snapshot: snapshot);
        } else {
          if (snapshot.hasError) {
            return SplashErrorWidget(snapshot: snapshot);
          } else {
            return const OnBoard();
          }
        }

      },
    );
  }
}
