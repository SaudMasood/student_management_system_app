import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/marks_model.dart';

class MarksController extends GetxController {

  final DatabaseHelper db = DatabaseHelper();

  final marks = <MarksModel>[].obs;

  final isLoading = false.obs;

  final studentIdController =
  TextEditingController();

  final subjectController =
  TextEditingController();

  final totalMarksController =
  TextEditingController();

  final obtainedMarksController =
  TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getMarks();
  }

  // GET MARKS
  Future<void> getMarks() async {
    isLoading.value = true;

    await db.initDatabase();

    final data = await db.getMarks();

    marks.assignAll(
      data.map(
            (item) => MarksModel.fromJson(item),
      ),
    );

    isLoading.value = false;
  }

  // ADD MARKS
  Future<void> addMarks() async {

    if (studentIdController.text.isEmpty ||
        subjectController.text.isEmpty ||
        totalMarksController.text.isEmpty ||
        obtainedMarksController.text.isEmpty) {

      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.addMarks(
      studentId: int.parse(
        studentIdController.text,
      ),

      subject: subjectController.text,

      totalMarks: int.parse(
        totalMarksController.text,
      ),

      obtainedMarks: int.parse(
        obtainedMarksController.text,
      ),
    );

    clearFields();

    await getMarks();

    Get.back();
  }

  // UPDATE MARKS
  Future<void> updateMarks(int id) async {

    if (studentIdController.text.isEmpty ||
        subjectController.text.isEmpty ||
        totalMarksController.text.isEmpty ||
        obtainedMarksController.text.isEmpty) {

      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.updateMarks(
      id: id,

      studentId: int.parse(
        studentIdController.text,
      ),

      subject: subjectController.text,

      totalMarks: int.parse(
        totalMarksController.text,
      ),

      obtainedMarks: int.parse(
        obtainedMarksController.text,
      ),
    );

    clearFields();

    await getMarks();

    Get.back();
  }

  // DELETE MARKS
  Future<void> deleteMarks(int id) async {

    await db.deleteMarks(id);

    await getMarks();
  }

  // CLEAR
  void clearFields() {
    studentIdController.clear();
    subjectController.clear();
    totalMarksController.clear();
    obtainedMarksController.clear();
  }

  @override
  void onClose() {

    studentIdController.dispose();
    subjectController.dispose();
    totalMarksController.dispose();
    obtainedMarksController.dispose();

    super.onClose();
  }
}