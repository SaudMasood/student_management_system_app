import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/addstudentcontroller.dart';

class StudentReportScreen extends StatelessWidget {
  const StudentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.find<StudentController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Report',
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

        if (controller.students.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 70,
                  color: Colors.grey,
                ),

                SizedBox(height: 15),

                Text(
                  'No Student Record',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'No students available for report',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),

          children: [
            Card(
              elevation: 4,

              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(
                    Icons.people,
                  ),
                ),

                title: const Text(
                  'Total Students',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                trailing: Text(
                  controller.students.length.toString(),

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Student Details',

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

              itemCount: controller.students.length,

              itemBuilder: (context, index) {
                final student =
                controller.students[index];

                return Card(
                  elevation: 3,

                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.all(12),

                    leading: CircleAvatar(
                      radius: 27,

                      backgroundColor:
                      Colors.blue.shade100,

                      child: Text(
                        student.id.toString(),

                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: Text(
                      student.name,

                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Student ID: ${student.id}',
                          ),

                          const SizedBox(height: 3),

                          Text(
                            'Roll No: ${student.rollNo}',
                          ),

                          const SizedBox(height: 3),

                          Text(
                            'Class: ${student.className}',
                          ),
                        ],
                      ),
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