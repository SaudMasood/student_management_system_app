import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/teacher_model.dart';

class TeacherController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final teachers = <TeacherModel>[].obs;

  final isLoading = false.obs;

  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getTeachers();
  }

  Future<void> getTeachers() async {
    isLoading.value = true;

    await db.initDatabase();

    final data = await db.getTeachers();

    teachers.assignAll(
      data.map(
            (item) => TeacherModel.fromJson(item),
      ),
    );

    isLoading.value = false;
  }

  Future<void> addTeacher() async {
    if (nameController.text.isEmpty ||
        subjectController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
      );
      return;
    }

    await db.addTeacher(
      name: nameController.text,
      subject: subjectController.text,
      phone: phoneController.text,
    );

    clearFields();

    await getTeachers();
  }

  Future<void> updateTeacher(int id) async {
    await db.updateTeacher(
      id: id,
      name: nameController.text,
      subject: subjectController.text,
      phone: phoneController.text,
    );

    clearFields();

    await getTeachers();
  }

  Future<void> deleteTeacher(int id) async {
    await db.deleteTeacher(id);

    await getTeachers();
  }

  void clearFields() {
    nameController.clear();
    subjectController.clear();
    phoneController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    subjectController.dispose();
    phoneController.dispose();

    super.onClose();
  }
}