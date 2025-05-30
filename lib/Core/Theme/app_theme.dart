import 'package:flutter/material.dart';
import 'package:snacky/Core/Utils/Constant/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.primary50,
    primaryColor: AppColors.primary500,
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.neutral900,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.primary500.withOpacity(0.05),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.neutral50),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.neutral900),
      bodyMedium: TextStyle(color: AppColors.neutral400),
    ),
    dividerColor: AppColors.neutral50,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary500,
      onPrimary: Colors.white,
      secondary: AppColors.secondary500,
      onSecondary: Colors.black,
      surface: Colors.white,
      onSurface: AppColors.neutral900,
      error: Colors.red,
      onError: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.neutral700,
    primaryColor: AppColors.primary500,
    cardColor: AppColors.primary600,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary900,
      foregroundColor: AppColors.neutral100,
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.primary500,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white.withOpacity(0.1),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.neutral400),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.neutral100),
      bodyMedium: TextStyle(color: AppColors.neutral300),
    ),
    dividerColor: AppColors.neutral400,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary500,
      onPrimary: Colors.black,
      secondary: AppColors.secondary500,
      onSecondary: Colors.white,
      surface: AppColors.primary600,
      onSurface: AppColors.neutral100,
      error: Colors.redAccent,
      onError: Colors.black,
    ),
  );
}
