import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_system/features/teachers/screen/teacher_report.dart';

import '../controller/TeacherController.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeacherController());

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Teachers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(12),

            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) =>
                      const TeacherReportScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.description,
                ),

                label: const Text(
                  'Teacher Report',
                ),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (controller.teachers.isEmpty) {
                return const Center(
                  child: Text('No Teachers'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),

                itemCount:
                controller.teachers.length,

                itemBuilder: (context, index) {
                  final teacher =
                  controller.teachers[index];

                  return Card(
                    elevation: 4,

                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          teacher.id.toString(),
                        ),
                      ),

                      title: Text(
                        teacher.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        'Subject: ${teacher.subject}\n'
                            'Phone: ${teacher.phone}',
                      ),

                      trailing: Row(
                        mainAxisSize:
                        MainAxisSize.min,

                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),

                            onPressed: () {
                              controller
                                  .nameController
                                  .text =
                                  teacher.name;

                              controller
                                  .subjectController
                                  .text =
                                  teacher.subject;

                              controller
                                  .phoneController
                                  .text =
                                  teacher.phone;

                              showTeacherDialog(
                                context,
                                controller,
                                teacher.id,
                              );
                            },
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                            onPressed: () {
                              controller
                                  .deleteTeacher(
                                teacher.id,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () {
          controller.clearFields();

          showTeacherDialog(
            context,
            controller,
            null,
          );
        },

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Teacher',
        ),
      ),
    );
  }

  void showTeacherDialog(
      BuildContext context,
      TeacherController controller,
      int? id,
      ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          title: Text(
            id == null
                ? 'Add Teacher'
                : 'Update Teacher',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              TextField(
                controller:
                controller.nameController,

                decoration: const InputDecoration(
                  labelText: 'Teacher Name',
                  prefixIcon:
                  Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller:
                controller.subjectController,

                decoration: const InputDecoration(
                  labelText: 'Subject',
                  prefixIcon:
                  Icon(Icons.book),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller:
                controller.phoneController,

                keyboardType:
                TextInputType.phone,

                decoration: const InputDecoration(
                  labelText: 'Phone',
                  prefixIcon:
                  Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await controller.addTeacher();
                } else {
                  await controller.updateTeacher(
                    id,
                  );
                }

                Navigator.pop(context);
              },

              child: Text(
                id == null
                    ? 'Add Teacher'
                    : 'Update',
              ),
            ),
          ],
        );
      },
    );
  }
}