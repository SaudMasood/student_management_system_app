import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final schoolNameController =
  TextEditingController();

  final phoneController =
  TextEditingController();

  final addressController =
  TextEditingController();

  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    loadSettings();
  }

  void changeTheme(bool value) {
    isDarkMode.value = value;
  }

  Future<void> saveSettings() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setString(
      'schoolName',
      schoolNameController.text,
    );

    await prefs.setString(
      'phone',
      phoneController.text,
    );

    await prefs.setString(
      'address',
      addressController.text,
    );

    Get.snackbar(
      'Success',
      'Settings saved',
    );
  }

  Future<void> loadSettings() async {
    final prefs =
    await SharedPreferences.getInstance();

    schoolNameController.text =
        prefs.getString('schoolName') ?? '';

    phoneController.text =
        prefs.getString('phone') ?? '';

    addressController.text =
        prefs.getString('address') ?? '';
  }

  @override
  void onClose() {
    schoolNameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.onClose();
  }
}