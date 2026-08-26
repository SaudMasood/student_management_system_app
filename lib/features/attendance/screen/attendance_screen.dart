import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/attendencecontroller.dart';
import 'attendance_report_screen.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AttendanceController(),
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Attendance',
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

        return Column(
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
                        const AttendanceReportScreen(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.assessment,
                  ),

                  label: const Text(
                    'Attendance Report',
                  ),
                ),
              ),
            ),

            if (controller.attendance.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No Attendance',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding:
                  const EdgeInsets.all(8),

                  itemCount:
                  controller.attendance.length,

                  itemBuilder:
                      (context, index) {
                    final item =
                    controller.attendance[index];

                    return Card(
                      elevation: 3,

                      margin:
                      const EdgeInsets.only(
                        bottom: 10,
                      ),

                      child: ListTile(
                        contentPadding:
                        const EdgeInsets.all(12),

                        leading: CircleAvatar(
                          backgroundColor:
                          item.status ==
                              'Present'
                              ? Colors.green
                              .shade100
                              : Colors.red
                              .shade100,

                          child: Icon(
                            item.status ==
                                'Present'
                                ? Icons.check
                                : Icons.close,

                            color: item.status ==
                                'Present'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),

                        title: Text(
                          'Student ID: '
                              '${item.studentId}',

                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        subtitle: Padding(
                          padding:
                          const EdgeInsets.only(
                            top: 5,
                          ),

                          child: Text(
                            'Status: ${item.status}',
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
                                    item.studentId
                                        .toString();

                                controller
                                    .status
                                    .value =
                                    item.status;

                                showAttendanceDialog(
                                  context,
                                  controller,
                                  item.id,
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
                                  'Delete Attendance',

                                  middleText:
                                  'Are you sure?',

                                  textCancel:
                                  'Cancel',

                                  textConfirm:
                                  'Delete',

                                  onConfirm: () {
                                    controller
                                        .deleteAttendance(
                                      item.id,
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
                ),
              ),
          ],
        );
      }),

      floatingActionButton:
      FloatingActionButton.extended(
        onPressed: () {
          controller.clearFields();

          showAttendanceDialog(
            context,
            controller,
            null,
          );
        },

        icon: const Icon(Icons.add),

        label: const Text(
          'Add Attendance',
        ),
      ),
    );
  }

  void showAttendanceDialog(
      BuildContext context,
      AttendanceController controller,
      int? id,
      ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: Text(
            id == null
                ? 'Add Attendance'
                : 'Update Attendance',

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

              const SizedBox(height: 12),

              Obx(
                    () => DropdownButtonFormField<
                    String>(
                  value:
                  controller.status.value,

                  decoration:
                  const InputDecoration(
                    labelText: 'Status',
                    border:
                    OutlineInputBorder(),
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Present',
                      child:
                      Text('Present'),
                    ),

                    DropdownMenuItem(
                      value: 'Absent',
                      child:
                      Text('Absent'),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      controller.status
                          .value = value;
                    }
                  },
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
                  await controller
                      .addAttendance();
                } else {
                  await controller
                      .updateAttendance(id);
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