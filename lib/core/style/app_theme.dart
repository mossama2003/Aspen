import 'package:aspen/core/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.green),
    primaryColor: AppColors.blue,
    textTheme: const TextTheme(
      // bodySmall: TextStyle(color: AppColors.blackGray, fontFamily: 'Montserrat'),
      // bodyMedium: TextStyle(color: AppColors.blackGray, fontFamily: 'Montserrat'),
      // bodyLarge: TextStyle(color: AppColors.blackGray, fontFamily: 'Montserrat'),
    ),
  );
}