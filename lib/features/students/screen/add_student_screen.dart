import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/addstudentcontroller.dart';

class AddStudentScreen extends StatefulWidget {
  final int? studentId;

  const AddStudentScreen({
    super.key,
    this.studentId,
  });

  @override
  State<AddStudentScreen> createState() =>
      _AddStudentScreenState();
}

class _AddStudentScreenState
    extends State<AddStudentScreen> {

  late StudentController controller;

  @override
  void initState() {
    super.initState();

    controller =
        Get.find<StudentController>();

    if (widget.studentId != null) {
      controller.getStudentForEdit(
        widget.studentId!,
      );
    } else {
      controller.clearFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit =
        widget.studentId != null;

    return Scaffold(

      appBar: AppBar(
        title: Text(
          isEdit
              ? 'Update Student'
              : 'Add Student',

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Card(
          elevation: 5,

          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(18),
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,

                    backgroundColor:
                    Colors.blue.shade100,

                    child: Icon(
                      isEdit
                          ? Icons.edit
                          : Icons.person_add,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text(
                    isEdit
                        ? 'Update Student Information'
                        : 'Add New Student',

                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller:
                  controller.nameController,

                  decoration:
                  const InputDecoration(
                    labelText: 'Student Name',
                    prefixIcon:
                    Icon(Icons.person),
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller:
                  controller.rollNoController,

                  decoration:
                  const InputDecoration(
                    labelText: 'Roll Number',
                    prefixIcon:
                    Icon(Icons.badge),
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller:
                  controller.classController,

                  decoration:
                  const InputDecoration(
                    labelText: 'Class',
                    prefixIcon:
                    Icon(Icons.school),
                    border:
                    OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,

                  height: 50,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (isEdit) {
                        controller.updateStudent(
                          widget.studentId!,
                        );
                      } else {
                        controller.addStudent();
                      }
                    },

                    icon: Icon(
                      isEdit
                          ? Icons.update
                          : Icons.add,
                    ),

                    label: Text(
                      isEdit
                          ? 'Update Student'
                          : 'Add Student',

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}