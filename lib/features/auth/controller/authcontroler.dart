import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:student_management_system/database/database_helper.dart';

class Authcontroler extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final nameC = TextEditingController();
  final emailc = TextEditingController();
  final passwordc = TextEditingController();

// signup
  Future<void> signup() async {
    if (nameC.text.isEmpty ||
        emailc.text.isEmpty ||
        passwordc.text.isEmpty) {
      Get.snackbar(
        'ERROR',
        'Please enter all data',
      );

      return;
    }

    await db.initDatabase();

    await db.addAdmin(
      name: nameC.text,
      email: emailc.text,
      password: passwordc.text,
    );

    Get.snackbar(
      'Success',
      'Admin Registered Successfully',
    );

    clearField();
  }
  // LOGIN
  Future<bool> sigin() async {
    if (emailc.text.isEmpty ||
        passwordc.text.isEmpty) {
      Get.snackbar(
        'ERROR',
        'Fill Data',
      );

      return false;
    }

    await db.initDatabase();

    final data = await db.getAdmin(
      emailc.text,
      passwordc.text,
    );

    if (data != null) {
      Get.snackbar(
        'Success',
        'Login Successful',
      );

      clearField();

      return true;
    }

    Get.snackbar(
      'ERROR',
      'Invalid Email or Password',
    );

    return false;
  }


  void clearField() {
    nameC.clear();
    emailc.clear();
    passwordc.clear();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailc.dispose();
    passwordc.dispose();

    super.onClose();
  }
}