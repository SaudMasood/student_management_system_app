import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/class_model.dart';

class ClassController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final classes = <ClassModel>[].obs;

  final isLoading = false.obs;

  final nameController = TextEditingController();
  final teacherController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getClasses();
  }

  Future<void> getClasses() async {
    isLoading.value = true;

    await db.initDatabase();

    final data = await db.getClasses();

    classes.assignAll(
      data.map(
            (item) => ClassModel.fromJson(item),
      ),
    );

    isLoading.value = false;
  }

  Future<void> addClass() async {
    if (nameController.text.isEmpty ||
        teacherController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.addClass(
      name: nameController.text,
      teacher: teacherController.text,
    );

    clearFields();

    await getClasses();
  }

  Future<void> updateClass(int id) async {
    if (nameController.text.isEmpty ||
        teacherController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.updateClass(
      id: id,
      name: nameController.text,
      teacher: teacherController.text,
    );

    clearFields();

    await getClasses();
  }

  Future<void> deleteClass(int id) async {
    await db.deleteClass(id);

    await getClasses();
  }

  void clearFields() {
    nameController.clear();
    teacherController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    teacherController.dispose();

    super.onClose();
  }
}