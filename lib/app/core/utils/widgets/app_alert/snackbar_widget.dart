import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/app_colors.dart';

class SnackbarAlertWidget {
  alertSucess({
    required String title,
    required String description,
  }) =>
      Get.snackbar(
        title,
        description,
        icon: const Icon(Icons.done_all_rounded, color: AppColors.white),
        shouldIconPulse: true,
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 4),
        maxWidth: 400,
        backgroundColor: Colors.green[600],
        colorText: AppColors.white,
        margin: const EdgeInsets.only(top: 16.0),
      );

  alertError({
    required String title,
    required String description,
  }) =>
      Get.snackbar(
        title,
        description,
        icon: const Icon(Icons.error_outline_rounded, color: AppColors.white),
        shouldIconPulse: true,
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 4),
        maxWidth: 400,
        backgroundColor: Colors.red[700],
        colorText: AppColors.white,
        margin: const EdgeInsets.only(top: 16.0),
      );

  alertWarning({
    required String title,
    required String description,
  }) =>
      Get.snackbar(
        title,
        description,
        icon: const Icon(Icons.warning_amber_rounded, color: AppColors.white),
        shouldIconPulse: true,
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 4),
        maxWidth: 400,
        backgroundColor: Colors.yellow[800],
        colorText: AppColors.white,
        margin: const EdgeInsets.only(top: 16.0),
      );
}
