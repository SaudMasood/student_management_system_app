import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/attendencecontroller.dart';

class AttendanceReportScreen extends StatelessWidget {
  const AttendanceReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AttendanceController(),
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Attendance Report',
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

        return Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [
              Card(
                elevation: 3,

                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.people,
                    ),
                  ),

                  title: const Text(
                    'Total Attendance',
                  ),

                  trailing: Text(
                    controller.totalAttendance
                        .toString(),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 3,

                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.check,
                    ),
                  ),

                  title: const Text(
                    'Present',
                  ),

                  trailing: Text(
                    controller.presentCount
                        .toString(),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 3,

                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.close,
                    ),
                  ),

                  title: const Text(
                    'Absent',
                  ),

                  trailing: Text(
                    controller.absentCount
                        .toString(),

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Card(
                elevation: 3,

                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(
                      Icons.percent,
                    ),
                  ),

                  title: const Text(
                    'Attendance Percentage',
                  ),

                  trailing: Text(
                    '${controller.percentage.toStringAsFixed(1)}%',

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  'Attendance Records',

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Expanded(
                child:
                controller.attendance.isEmpty
                    ? const Center(
                  child: Text(
                    'No Attendance Record',
                  ),
                )
                    : ListView.builder(
                  itemCount:
                  controller
                      .attendance
                      .length,

                  itemBuilder:
                      (context, index) {
                    final item =
                    controller
                        .attendance[
                    index];

                    return Card(
                      elevation: 2,

                      margin:
                      const EdgeInsets
                          .only(
                        bottom: 8,
                      ),

                      child: ListTile(
                        leading:
                        CircleAvatar(
                          child: Text(
                            item.studentId
                                .toString(),
                          ),
                        ),

                        title: Text(
                          'Student ID: '
                              '${item.studentId}',

                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        subtitle:
                        Text(
                          'Status: '
                              '${item.status}',
                        ),

                        trailing: Icon(
                          item.status ==
                              'Present'
                              ? Icons.check
                              : Icons.close,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}