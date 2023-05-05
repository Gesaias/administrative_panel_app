
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash.controller.dart';

class SplashErrorWidget extends GetWidget<SplashController> {
  AsyncSnapshot<void> snapshot;

  SplashErrorWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.context!.width,
        height: Get.context!.height,
        color: Colors.red[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'icons/sad_face.png',
                fit: BoxFit.contain,
                height: 130,
              ),
            ),
            Text(
              'Sorry, there was an error.',
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 28,
              ),
            ),
            Text(
              'Erro: ${snapshot.error}',
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
