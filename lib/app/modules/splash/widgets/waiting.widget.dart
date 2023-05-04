import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/utils/getcolorfromhex.dart';

class SplashWaitingWidget extends GetWidget {
  AsyncSnapshot<void> snapshot;

  SplashWaitingWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: Get.context!.height,
        width: Get.context!.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 350,
                    child: CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor[500],
                      child: const SizedBox(
                        width: 340,
                        height: 340,
                        child: CircleAvatar(
                          backgroundColor: AppColors.kPrimaryColor,
                          backgroundImage: AssetImage('images/logo.jpeg'),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                  const Text(
                    'Loading...',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'images/logo.jpeg',
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '©2023 Amo Promo',
                        style: GoogleFonts.sourceSansPro(
                          color: getColorFromHex('4E555B'),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
