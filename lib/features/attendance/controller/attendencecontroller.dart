import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/attendance_model.dart';

class AttendanceController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final attendance = <AttendanceModel>[].obs;

  final isLoading = false.obs;

  final studentIdController =
  TextEditingController();

  final status = 'Present'.obs;

  @override
  void onInit() {
    super.onInit();

    getAttendance();
  }

  Future<void> getAttendance() async {
    isLoading.value = true;

    await db.initDatabase();

    final data = await db.getAttendance();

    attendance.assignAll(
      data.map(
            (item) => AttendanceModel.fromJson(item),
      ),
    );

    isLoading.value = false;
  }

  Future<void> addAttendance() async {
    if (studentIdController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Enter Student ID',
      );

      return;
    }

    await db.addAttendance(
      studentId: int.parse(
        studentIdController.text,
      ),
      status: status.value,
    );

    clearFields();

    await getAttendance();
  }

  Future<void> updateAttendance(int id) async {
    if (studentIdController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Enter Student ID',
      );

      return;
    }

    await db.updateAttendance(
      id: id,
      studentId: int.parse(
        studentIdController.text,
      ),
      status: status.value,
    );

    clearFields();

    await getAttendance();
  }

  Future<void> deleteAttendance(int id) async {
    await db.deleteAttendance(id);

    await getAttendance();
  }

  int get totalAttendance {
    return attendance.length;
  }

  int get presentCount {
    return attendance
        .where((item) => item.status == 'Present')
        .length;
  }

  int get absentCount {
    return attendance
        .where((item) => item.status == 'Absent')
        .length;
  }

  double get percentage {
    if (attendance.isEmpty) {
      return 0;
    }

    return (presentCount / totalAttendance) * 100;
  }

  void clearFields() {
    studentIdController.clear();
    status.value = 'Present';
  }

  @override
  void onClose() {
    studentIdController.dispose();

    super.onClose();
  }
}