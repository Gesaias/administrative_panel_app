import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/app_colors.dart';

class LoadingElevatedButtonWidget extends GetWidget {
  double? height;
  double? width;
  Color? backgroundColor;
  Color? color;

  LoadingElevatedButtonWidget({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
      width: width ?? 20,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor ?? AppColors.white,
        color: color ?? AppColors.kPrimaryColor,
      ),
    );
  }
}

