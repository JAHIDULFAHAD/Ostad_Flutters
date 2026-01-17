import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.themeColor,
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      inputDecorationTheme: _getInputDecorationTheme(),
      filledButtonTheme: _getFilledButtonTheme(),
    );
  }

  static ThemeData get drakTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
      inputDecorationTheme: _getInputDecorationTheme(),
      filledButtonTheme: _getFilledButtonTheme(),
    );
  }

  static InputDecorationTheme _getInputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );
  }
  static FilledButtonThemeData _getFilledButtonTheme() {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.themeColor,
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
          )
      ),
    );
  }
}
