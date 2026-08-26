import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'features/settings/controller/seetingcontroller.dart';
import 'features/splash/screen/splash_screen.dart';

void main() {
  Get.put(SettingsController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.find<SettingsController>();

    return Obx(
          () => MaterialApp(
        debugShowCheckedModeBanner: false,

        title:
        'School Management System',

        theme:
        AppTheme.lightTheme,

        darkTheme:
        AppTheme.darkTheme,

        themeMode:
        controller.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,

        home:
        const SplashScreen(),
      ),
    );
  }
}