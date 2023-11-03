import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 22, color: AppColors.white);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          toolbarHeight: 65,
          titleTextStyle: appBarTextStyle,
          backgroundColor: AppColors.primary),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          bodySmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          titleLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
  );
}
