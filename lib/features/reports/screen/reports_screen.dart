import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../attendance/screen/attendance_screen.dart';
import '../../classes/screen/classes_screen.dart';
import '../../exams/screen/marks_screen.dart';
import '../../fees/screen/fees_screen.dart';
import '../../students/screen/students_screen.dart';
import '../../teachers/screen/teachers_screen.dart';
import '../controller/report_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ReportController(),
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Reports',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final reports = [
          {
            'title': 'Students',
            'count': controller.students.value,
            'icon': Icons.people,
            'color': Colors.blue,
            'screen': const StudentScreen(),
          },
          {
            'title': 'Teachers',
            'count': controller.teachers.value,
            'icon': Icons.person,
            'color': Colors.green,
            'screen': const TeacherScreen(),
          },
          {
            'title': 'Classes',
            'count': controller.classes.value,
            'icon': Icons.class_,
            'color': Colors.orange,
            'screen': const ClassScreen(),
          },
          {
            'title': 'Attendance',
            'count': controller.attendance.value,
            'icon': Icons.check_circle,
            'color': Colors.purple,
            'screen': const AttendanceScreen(),
          },
          {
            'title': 'Fees',
            'count': controller.fees.value,
            'icon': Icons.payment,
            'color': Colors.red,
            'screen': const FeeScreen(),
          },
          {
            'title': 'Marks',
            'count': controller.marks.value,
            'icon': Icons.school,
            'color': Colors.teal,
            'screen': const MarksScreen(),
          },
        ];

        return ListView.builder(
          padding: const EdgeInsets.all(16),

          itemCount: reports.length,

          itemBuilder: (context, index) {
            final report = reports[index];

            return Card(
              elevation: 4,

              margin: const EdgeInsets.only(
                bottom: 12,
              ),

              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15),
              ),

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(14),

                leading: CircleAvatar(
                  radius: 28,

                  backgroundColor:
                  (report['color'] as Color)
                      .withOpacity(0.15),

                  child: Icon(
                    report['icon'] as IconData,
                    color:
                    report['color'] as Color,
                  ),
                ),

                title: Text(
                  report['title'] as String,

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  'Total ${report['title']}',
                ),

                trailing: Row(
                  mainAxisSize:
                  MainAxisSize.min,

                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),

                      decoration: BoxDecoration(
                        color:
                        (report['color'] as Color)
                            .withOpacity(0.1),

                        borderRadius:
                        BorderRadius.circular(10),
                      ),

                      child: Text(
                        report['count'].toString(),

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                          color:
                          report['color']
                          as Color,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      report['screen']
                      as Widget,
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}