import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_system/features/students/screen/studentreport.dart';

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
        title: const Text(
          'Students',
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
                      const StudentReportScreen(),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.description,
                ),

                label: const Text(
                  'Student Report',
                ),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child:
                  CircularProgressIndicator(),
                );
              }

              if (controller.students.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 70,
                        color: Colors.grey,
                      ),

                      SizedBox(height: 15),

                      Text(
                        'No Students',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                          FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Add a student to get started',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding:
                const EdgeInsets.all(12),

                itemCount:
                controller.students.length,

                itemBuilder:
                    (context, index) {
                  final student =
                  controller.students[index];

                  return Card(
                    elevation: 4,

                    margin:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        15,
                      ),
                    ),

                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.all(
                        12,
                      ),

                      leading:
                      CircleAvatar(
                        radius: 28,

                        backgroundColor:
                        Colors.blue.shade100,

                        child: Text(
                          student.name.isEmpty
                              ? '?'
                              : student.name[0]
                              .toUpperCase(),

                          style: TextStyle(
                            color: Colors
                                .blue.shade700,
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),

                      title: Text(
                        student.name,

                        style:
                        const TextStyle(
                          fontSize: 17,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      subtitle:
                      Padding(
                        padding:
                        const EdgeInsets
                            .only(
                          top: 6,
                        ),

                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                          children: [
                            Text(
                              'ID: ${student.id}',
                            ),

                            const SizedBox(
                              height: 3,
                            ),

                            Text(
                              'Roll No: '
                                  '${student.rollNo}',
                            ),

                            const SizedBox(
                              height: 3,
                            ),

                            Text(
                              'Class: '
                                  '${student.className}',
                            ),
                          ],
                        ),
                      ),

                      trailing: Row(
                        mainAxisSize:
                        MainAxisSize.min,

                        children: [
                          IconButton(
                            icon:
                            const Icon(
                              Icons.edit,
                              color: Colors.blue,
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

                              controller
                                  .getStudents();
                            },
                          ),

                          IconButton(
                            icon:
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),

                            onPressed: () {
                              controller
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
              );
            }),
          ),
        ],
      ),

      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
              const AddStudentScreen(),
            ),
          );

          controller.getStudents();
        },

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Student',
        ),
      ),
    );
  }
}