import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/markscontroller.dart';

class MarksReportScreen extends StatelessWidget {
  const MarksReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.find<MarksController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marks Report',
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.marks.isEmpty) {
          return const Center(
            child: Text(
              'No Marks Record',
            ),
          );
        }

        double obtained = 0;
        double total = 0;

        for (var mark in controller.marks) {
          obtained += mark.obtainedMarks;
          total += mark.totalMarks;
        }

        double average =
            (obtained / total) * 100;

        return ListView(
          padding: const EdgeInsets.all(16),

          children: [
            Card(
              elevation: 4,

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.school),
                ),

                title: const Text(
                  'Total Marks Records',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                trailing: Text(
                  controller.marks.length.toString(),

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 4,

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.score),
                ),

                title: const Text(
                  'Total Obtained Marks',
                ),

                trailing: Text(
                  obtained.toStringAsFixed(0),

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 4,

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.assessment),
                ),

                title: const Text(
                  'Total Marks',
                ),

                trailing: Text(
                  total.toStringAsFixed(0),

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 4,

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.percent),
                ),

                title: const Text(
                  'Average Percentage',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                trailing: Text(
                  '${average.toStringAsFixed(1)}%',

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Marks Details',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ListView.builder(
              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),

              itemCount: controller.marks.length,

              itemBuilder: (context, index) {
                final mark =
                controller.marks[index];

                double percentage =
                    (mark.obtainedMarks /
                        mark.totalMarks) *
                        100;

                return Card(
                  elevation: 3,

                  margin:
                  const EdgeInsets.only(
                    bottom: 10,
                  ),

                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        mark.studentId.toString(),
                      ),
                    ),

                    title: Text(
                      mark.subject,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      'Student ID: ${mark.studentId}\n'
                          'Obtained Marks: ${mark.obtainedMarks}\n'
                          'Total Marks: ${mark.totalMarks}\n'
                          'Percentage: '
                          '${percentage.toStringAsFixed(1)}%',
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}