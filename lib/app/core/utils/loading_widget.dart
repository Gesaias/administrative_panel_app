import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../themes/app_colors.dart';

class LoadingWidget extends GetWidget {
  double? width;
  double? height;
  Color? backgroundColor;
  Color? color;

  LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: backgroundColor ?? AppColors.kPrimaryColor,
          color: color ?? AppColors.white,
        ),
      ),
    );
  }
}
