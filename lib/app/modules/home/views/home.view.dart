import 'package:administrative_panel_app/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.kSecondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar Aeroporto...',
                  hintStyle: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  controller.debouncer(() {
                    controller.setSearchQuery(value);
                  });
                },
              ),
            ),
            const VerticalDivider(
              width: 12.0,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
