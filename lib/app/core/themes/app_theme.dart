import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData themData = ThemeData(
    primarySwatch: AppColors.kPrimaryColor,
    primaryColor: AppColors.kPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.sourceSansProTextTheme(),
    brightness: Brightness.light,
    inputDecorationTheme: _inputDecorationTheme,
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: _inputDecorationTheme,
    ),
  );

  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kPrimaryColor,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kPrimaryColor,
        width: 2,
      ),
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    floatingLabelStyle: TextStyle(
      color: AppColors.kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
  );
}
