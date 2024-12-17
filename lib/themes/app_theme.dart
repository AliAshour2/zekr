import 'package:flutter/material.dart';
import 'package:zekr/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.mainLightColor,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: AppColors.black,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        surface: Colors.white,
        onSurface: Colors.white),
    dividerColor: AppColors.mainLightColor,
    dividerTheme: const DividerThemeData(color: AppColors.mainLightColor),
    iconTheme: const IconThemeData(color: AppColors.black),
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: AppColors.black)),
    primaryColor: AppColors.mainLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 30),
      centerTitle: true,
      elevation: 0.0,
    ),
    canvasColor: AppColors.mainLightColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: AppColors.mainLightColor,
      selectedItemColor: AppColors.black,
      unselectedItemColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.mainDarkColor,
        onPrimary: AppColors.mainDarkColor,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        surface: Colors.white,
        onSurface: Colors.white),
    dividerColor: AppColors.mainLightColor,
    dividerTheme: const DividerThemeData(color: AppColors.mainLightColor),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white)),
    primaryColor: AppColors.mainDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
      centerTitle: true,
      elevation: 0.0,
    ),
    canvasColor: AppColors.mainDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.mainDarkColor,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: Colors.white,
    ),
  );
}
