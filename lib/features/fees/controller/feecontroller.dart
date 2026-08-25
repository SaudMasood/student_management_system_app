import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../../exams/model/marks_model.dart';

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

  Future<void> addMarks() async {

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

  Future<void> updateMarks(int id) async {

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

  Future<void> deleteMarks(int id) async {

    await db.deleteMarks(id);

    await getMarks();
  }

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