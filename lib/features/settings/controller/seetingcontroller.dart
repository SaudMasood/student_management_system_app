import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final schoolNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final isDarkMode = false.obs;

  void changeTheme(bool value) {
    isDarkMode.value = value;
  }

  void saveSettings() {
    Get.snackbar(
      'Success',
      'Settings saved',
    );
  }

  @override
  void onClose() {
    schoolNameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.onClose();
  }
}