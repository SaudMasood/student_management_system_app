import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/classcontroller.dart';
import 'classReport.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClassController());

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Classes',
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
                      const ClassReportScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.description,
                ),

                label: const Text(
                  'Class Report',
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

              if (controller.classes.isEmpty) {
                return const Center(
                  child: Text('No Classes'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),

                itemCount:
                controller.classes.length,

                itemBuilder: (context, index) {
                  final classData =
                  controller.classes[index];

                  return Card(
                    elevation: 4,

                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          classData.id.toString(),
                        ),
                      ),

                      title: Text(
                        classData.name,
                        style: const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        'ID: ${classData.id}\n'
                            'Teacher: ${classData.teacher}',
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
                                  classData.name;

                              controller
                                  .teacherController
                                  .text =
                                  classData.teacher;

                              showClassDialog(
                                context,
                                controller,
                                classData.id,
                              );
                            },
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                            onPressed: () {
                              Get.defaultDialog(
                                title:
                                'Delete Class',

                                middleText:
                                'Are you sure?',

                                textCancel:
                                'Cancel',

                                textConfirm:
                                'Delete',

                                onConfirm: () {
                                  controller
                                      .deleteClass(
                                    classData.id,
                                  );

                                  Get.back();
                                },
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

          showClassDialog(
            context,
            controller,
            null,
          );
        },

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Class',
        ),
      ),
    );
  }

  void showClassDialog(
      BuildContext context,
      ClassController controller,
      int? id,
      ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: Text(
            id == null
                ? 'Add Class'
                : 'Update Class',

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize:
            MainAxisSize.min,

            children: [
              TextField(
                controller:
                controller.nameController,

                decoration:
                const InputDecoration(
                  labelText: 'Class Name',
                  border:
                  OutlineInputBorder(),
                  prefixIcon:
                  Icon(Icons.class_),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller:
                controller.teacherController,

                decoration:
                const InputDecoration(
                  labelText: 'Teacher',
                  border:
                  OutlineInputBorder(),
                  prefixIcon:
                  Icon(Icons.person),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child:
              const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () async {
                if (id == null) {
                  await controller.addClass();
                } else {
                  await controller.updateClass(id);
                }

                Navigator.pop(context);
              },

              child: Text(
                id == null
                    ? 'Add Class'
                    : 'Update',
              ),
            ),
          ],
        );
      },
    );
  }
}