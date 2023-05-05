import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/app_colors.dart';
import '../../../core/utils/loading_widget.dart';
import '../../../core/utils/widgets/error_widget/error_view.widget.dart';
import '../../../core/utils/widgets/not_found/not_found_error.widget.dart';
import '../controllers/home.controller.dart';
import '../widgets/list_airports.widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.kSecondaryColor,
        title: Text(
          'Airports',
          style: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.isLoading) {
              return LoadingWidget();
            } else if (!controller.isLoading &&
                controller.airports.length > 1) {
              return const ListAirportsWidget();
            } else if (!controller.isLoading && controller.airports.isEmpty) {
              return NotFoundErrorWidget(title: 'No airport found!');
            }

            return ErrorViewWidget(title: 'There was an error in the search!');
          },
        ),
      ),
    );
  }
}
