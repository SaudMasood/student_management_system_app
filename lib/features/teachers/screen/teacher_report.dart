import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/TeacherController.dart';
import '../../../database/database_helper.dart';

class TeacherReportScreen extends StatelessWidget {
  const TeacherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.find<TeacherController>();

    final db = DatabaseHelper();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teacher Report',
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.teachers.isEmpty) {
          return const Center(
            child: Text(
              'No Teacher Record',
            ),
          );
        }

        return FutureBuilder<List<Map<String, dynamic>>>(
          future: db.getClasses(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final classes = snapshot.data!;

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
                      'Total Teachers',
                      style: TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    trailing: Text(
                      controller.teachers.length
                          .toString(),

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 4,

                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.class_,
                      ),
                    ),

                    title: const Text(
                      'Total Classes',
                      style: TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    trailing: Text(
                      classes.length.toString(),

                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Teacher Details',

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ListView.builder(
                  shrinkWrap: true,

                  physics:
                  const NeverScrollableScrollPhysics(),

                  itemCount:
                  controller.teachers.length,

                  itemBuilder:
                      (context, index) {
                    final teacher =
                    controller.teachers[index];

                    final assignedClasses =
                        classes.where(
                              (item) =>
                          item['teacher']
                              .toString() ==
                              teacher.name,
                        ).length;

                    return Card(
                      elevation: 3,

                      margin:
                      const EdgeInsets.only(
                        bottom: 10,
                      ),

                      child: ListTile(
                        leading:
                        CircleAvatar(
                          child: Text(
                            teacher.id
                                .toString(),
                          ),
                        ),

                        title: Text(
                          teacher.name,

                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          'ID: ${teacher.id}\n'
                              'Subject: ${teacher.subject}\n'
                              'Phone: ${teacher.phone}\n'
                              'Assigned Classes: $assignedClasses',
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      }),
    );
  }
}