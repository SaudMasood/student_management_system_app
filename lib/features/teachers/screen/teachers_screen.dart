import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.teachers.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people_outline,
                  size: 70,
                  color: Colors.grey,
                ),

                SizedBox(height: 15),

                Text(
                  'No Teachers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'Add a teacher to get started',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),

          itemCount: controller.teachers.length,

          itemBuilder: (context, index) {
            final teacher =
            controller.teachers[index];

            return Card(
              elevation: 4,

              margin: const EdgeInsets.only(
                bottom: 12,
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(12),

                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor:
                  Colors.green.shade100,

                  child: Text(
                    teacher.name.isEmpty
                        ? '?'
                        : teacher.name[0]
                        .toUpperCase(),

                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),

                title: Text(
                  teacher.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Padding(
                  padding:
                  const EdgeInsets.only(top: 6),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [
                      Text(
                        'ID: ${teacher.id}',
                      ),

                      const SizedBox(height: 3),

                      Text(
                        'Subject: ${teacher.subject}',
                      ),

                      const SizedBox(height: 3),

                      Text(
                        'Phone: ${teacher.phone}',
                      ),
                    ],
                  ),
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
                        controller.deleteTeacher(
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