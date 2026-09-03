import 'package:flutter/material.dart';
import 'package:my_lms/bloc/font/font_state.dart';
import 'package:my_lms/core/theme/app_colors.dart';
import 'package:my_lms/core/theme/app_typography.dart';
import 'package:my_lms/service/font_service.dart';

class AppTheme {
  static ThemeData getLightTheme(FontState fontState) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontState.fontFamily,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
      ),
      textTheme: FontService.customTextTheme(
        baseTheme: AppTypography.lightTextTheme,
        fontScale: fontState.fontScale,
        fontFamily: fontState.fontFamily,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.lightDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: AppColors.lightDivider),
        ),
      )
    );
  }
}
