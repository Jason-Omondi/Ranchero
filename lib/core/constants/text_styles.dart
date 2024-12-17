import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textDark),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark),
    displaySmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark),
    headlineMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textDark),
    headlineSmall: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.textDark),
    titleLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.textDark),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textLight),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.white),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.white),
    displaySmall: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
    headlineMedium: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.white),
    headlineSmall: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.white),
    titleLarge: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.white),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.textLight),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.white),
  );
}
