import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    primarySwatch: Colors.blue,

    scaffoldBackgroundColor:
    AppColors.background,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primarySwatch: Colors.blue,

    scaffoldBackgroundColor:
    const Color(0xFF121212),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: AppColors.white,
    ),
  );
}