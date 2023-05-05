import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/app_colors.dart';

class NotFoundErrorWidget extends GetView {
  String? title;

  NotFoundErrorWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'Nothing found!',
      style: GoogleFonts.sourceSansPro(
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
    );
  }
}
