import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData _getTheme({required ColorScheme colorScheme}) {
    return ThemeData(colorScheme: colorScheme, splashColor: Colors.transparent);
  }

  static ThemeData getLightThemeData() {
    return _getTheme(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.blue,
        onPrimary: AppColors.white,
        secondary: AppColors.darkBlue,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        surface: AppColors.white,
        onSurface: AppColors.blue,
      ),
    );
  }
}
