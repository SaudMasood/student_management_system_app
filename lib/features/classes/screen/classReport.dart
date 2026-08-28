import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/classcontroller.dart';

class ClassReportScreen extends StatelessWidget {
  const ClassReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
    Get.find<ClassController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Class Report',
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.classes.isEmpty) {
          return const Center(
            child: Text(
              'No Class Record',
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
                  child: Icon(Icons.class_),
                ),

                title: const Text(
                  'Total Classes',
                  style: TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                trailing: Text(
                  controller.classes.length
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

            const Text(
              'Class Details',

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
              controller.classes.length,

              itemBuilder:
                  (context, index) {
                final classData =
                controller.classes[index];

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
                        classData.id
                            .toString(),
                      ),
                    ),

                    title: Text(
                      classData.name,

                      style:
                      const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      'ID: ${classData.id}\n'
                          'Teacher: ${classData.teacher}',
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