import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/markscontroller.dart';

class MarksScreen extends StatelessWidget {
  const MarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      MarksController(),
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Marks',
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

        if (controller.marks.isEmpty) {
          return const Center(
            child: Text(
              'No Marks',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),

          itemCount:
          controller.marks.length,

          itemBuilder: (context, index) {
            final mark =
            controller.marks[index];

            return Card(
              elevation: 3,

              margin: const EdgeInsets.only(
                bottom: 10,
              ),

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(12),

                leading: CircleAvatar(
                  backgroundColor:
                  Colors.blue.shade100,

                  child: Text(
                    mark.studentId
                        .toString(),

                    style: TextStyle(
                      color:
                      Colors.blue.shade700,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                title: Text(
                  mark.subject,

                  style: const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                    fontSize: 17,
                  ),
                ),

                subtitle: Padding(
                  padding:
                  const EdgeInsets.only(
                    top: 5,
                  ),

                  child: Text(
                    'Student ID: '
                        '${mark.studentId}\n'
                        'Marks: '
                        '${mark.obtainedMarks} / '
                        '${mark.totalMarks}',
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
                            .studentIdController
                            .text =
                            mark.studentId
                                .toString();

                        controller
                            .subjectController
                            .text =
                            mark.subject;

                        controller
                            .totalMarksController
                            .text =
                            mark.totalMarks
                                .toString();

                        controller
                            .obtainedMarksController
                            .text =
                            mark.obtainedMarks
                                .toString();

                        showMarksDialog(
                          context,
                          controller,
                          mark.id,
                        );
                      },
                    ),

                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),

                      onPressed: () {
                        controller.deleteMarks(
                          mark.id,
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

          showMarksDialog(
            context,
            controller,
            null,
          );
        },

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Marks',
        ),
      ),
    );
  }

  void showMarksDialog(
      BuildContext context,
      MarksController controller,
      int? id,
      ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: Text(
            id == null
                ? 'Add Marks'
                : 'Update Marks',

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
                controller
                    .studentIdController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(
                  labelText: 'Student ID',
                  border:
                  OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller:
                controller
                    .subjectController,

                decoration:
                const InputDecoration(
                  labelText: 'Subject',
                  border:
                  OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller:
                controller
                    .totalMarksController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(
                  labelText: 'Total Marks',
                  border:
                  OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller:
                controller
                    .obtainedMarksController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(
                  labelText: 'Obtained Marks',
                  border:
                  OutlineInputBorder(),
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
              onPressed: () {
                if (id == null) {
                  controller.addMarks();
                } else {
                  controller.updateMarks(id);
                }

                Navigator.pop(context);
              },

              child: Text(
                id == null
                    ? 'Add'
                    : 'Update',
              ),
            ),
          ],
        );
      },
    );
  }
}