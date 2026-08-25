import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/student_model.dart';

class StudentController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final students = <StudentModel>[].obs;

  final isLoading = false.obs;

  final nameController = TextEditingController();
  final rollNoController = TextEditingController();
  final classController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    getStudents();
  }

  // ================= GET STUDENTS =================

  Future<void> getStudents() async {
    try {
      isLoading.value = true;

      await db.initDatabase();

      final studentData =
      await db.getStudents();

      List<StudentModel> list = [];

      for (final data in studentData) {
        final student =
        StudentModel.fromJson(data);

        // Get student's fee
        final fees =
        await db.getStudentFees(student.id);

        if (fees.isNotEmpty) {
          student.feeStatus =
              fees.last['status'].toString();
        }

        // Get student's attendance
        final attendance =
        await db.getAttendance();

        final studentAttendance =
        attendance.where((item) {
          return item['student_id'] ==
              student.id;
        }).toList();

        if (studentAttendance.isNotEmpty) {
          int present = 0;

          for (final item
          in studentAttendance) {
            if (item['status']
                .toString()
                .toLowerCase() ==
                'present') {
              present++;
            }
          }

          student.attendance =
              (present /
                  studentAttendance.length) *
                  100;
        }

        list.add(student);
      }

      students.assignAll(list);
    } finally {
      isLoading.value = false;
    }
  }

  // ================= ADD STUDENT =================

  Future<void> addStudent() async {
    if (nameController.text.isEmpty ||
        rollNoController.text.isEmpty ||
        classController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.addStudent(
      name: nameController.text.trim(),
      rollNo: rollNoController.text.trim(),
      className:
      classController.text.trim(),
    );

    clearFields();

    await getStudents();

    Get.back();
  }

  // ================= UPDATE STUDENT =================

  Future<void> updateStudent(int id) async {
    if (nameController.text.isEmpty ||
        rollNoController.text.isEmpty ||
        classController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
      );

      return;
    }

    await db.updateStudent(
      id: id,
      name: nameController.text.trim(),
      rollNo: rollNoController.text.trim(),
      className:
      classController.text.trim(),
    );

    clearFields();

    await getStudents();

    Get.back();
  }

  // ================= LOAD STUDENT =================

  Future<void> getStudentForEdit(int id) async {
    final data =
    await db.getStudent(id);

    if (data == null) {
      return;
    }

    nameController.text =
        data['name'].toString();

    rollNoController.text =
        data['roll_no'].toString();

    classController.text =
        data['class_name'].toString();
  }

  // ================= DELETE =================

  Future<void> deleteStudent(int id) async {
    await db.deleteStudent(id);

    await getStudents();
  }

  // ================= CLEAR =================

  void clearFields() {
    nameController.clear();
    rollNoController.clear();
    classController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    rollNoController.dispose();
    classController.dispose();

    super.onClose();
  }
}