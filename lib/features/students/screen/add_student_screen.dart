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
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
              controller.nameController,

              decoration:
              const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              controller.rollNoController,

              decoration:
              const InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
              controller.classController,

              decoration:
              const InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {

                  if (isEdit) {
                    controller.updateStudent(
                      widget.studentId!,
                    );
                  } else {
                    controller.addStudent();
                  }

                },

                child: Text(
                  isEdit
                      ? 'Update Student'
                      : 'Add Student',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}