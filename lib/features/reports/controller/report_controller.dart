import 'package:get/get.dart';

import '../../../database/database_helper.dart';

class ReportController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final isLoading = false.obs;

  final students = 0.obs;
  final teachers = 0.obs;
  final classes = 0.obs;

  final attendance = 0.obs;
  final fees = 0.obs;
  final marks = 0.obs;

  @override
  void onInit() {
    super.onInit();

    getReport();
  }

  Future<void> getReport() async {
    isLoading.value = true;

    await db.initDatabase();

    final studentData = await db.getStudents();
    final teacherData = await db.getTeachers();
    final classData = await db.getClasses();
    final attendanceData = await db.getAttendance();
    final feeData = await db.getFees();
    final marksData = await db.getMarks();

    students.value = studentData.length;
    teachers.value = teacherData.length;
    classes.value = classData.length;
    attendance.value = attendanceData.length;
    fees.value = feeData.length;
    marks.value = marksData.length;

    isLoading.value = false;
  }
}