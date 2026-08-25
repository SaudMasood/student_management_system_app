import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/addstudentcontroller.dart';
import 'add_student_screen.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller =
    Get.put(StudentController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),

      body: Obx(() {

        if (controller.isLoading.value) {
          return const Center(
            child:
            CircularProgressIndicator(),
          );
        }

        return Column(
          children: [

            Padding(
              padding:
              const EdgeInsets.all(16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: () async {

                    await Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const AddStudentScreen(),
                      ),
                    );

                    await controller
                        .getStudents();
                  },

                  icon:
                  const Icon(Icons.add),

                  label:
                  const Text(
                    'Add Student',
                  ),
                ),
              ),
            ),

            if (controller.students.isEmpty)

              const Expanded(
                child: Center(
                  child:
                  Text('No Students'),
                ),
              )

            else

              Expanded(
                child:
                ListView.builder(

                  itemCount:
                  controller.students.length,

                  itemBuilder:
                      (context, index) {

                    final student =
                    controller.students[index];

                    return Card(
                      margin:
                      const EdgeInsets.all(8),

                      child: ListTile(

                        leading:
                        CircleAvatar(
                          child: Text(
                            student.name
                                .isEmpty
                                ? '?'
                                : student.name[0]
                                .toUpperCase(),
                          ),
                        ),

                        title:
                        Text(
                          student.name,
                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        subtitle:
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(
                              'ID: ${student.id}',
                            ),

                            Text(
                              'Roll No: '
                                  '${student.rollNo}',
                            ),

                            Text(
                              'Class: '
                                  '${student.className}',
                            ),

                            Text(
                              'Fee: '
                                  '${student.feeStatus}',
                            ),

                            Text(
                              'Attendance: '
                                  '${student.attendance.toStringAsFixed(1)}%',
                            ),
                          ],
                        ),

                        trailing:
                        Row(
                          mainAxisSize:
                          MainAxisSize.min,

                          children: [

                            IconButton(
                              icon:
                              const Icon(
                                Icons.edit,
                              ),

                              onPressed:
                                  () async {

                                await Navigator
                                    .push(
                                  context,

                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                        AddStudentScreen(
                                          studentId:
                                          student.id,
                                        ),
                                  ),
                                );

                                await controller
                                    .getStudents();
                              },
                            ),

                            IconButton(
                              icon:
                              const Icon(
                                Icons.delete,
                              ),

                              onPressed:
                                  () async {

                                await controller
                                    .deleteStudent(
                                  student.id,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      }),
    );
  }
}