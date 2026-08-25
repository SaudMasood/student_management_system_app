import 'package:flutter/material.dart';
import 'package:student_management_system/features/splash/screen/splash_screen.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}