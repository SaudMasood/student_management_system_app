import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/feecontroller.dart';


class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fees'),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.fees.isEmpty) {
          return const Center(
            child: Text('No Fee Record'),
          );
        }

        return ListView.builder(
          itemCount: controller.fees.length,
          itemBuilder: (context, index) {
            final fee = controller.fees[index];

            return Card(
              child: ListTile(
                title: Text(
                  'Student ID: ${fee['student_id']}',
                ),

                subtitle: Text(
                  'Amount: ${fee['amount']}\n'
                      'Status: ${fee['status']}',
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // EDIT
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        controller.studentId.text =
                            fee['student_id'].toString();

                        controller.amount.text =
                            fee['amount'].toString();

                        controller.isPaid.value =
                            fee['status'] == 'Paid';

                        feeDialog(
                          controller,
                          fee['id'],
                        );
                      },
                    ),

                    // DELETE
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Delete Fee',
                          middleText: 'Are you sure?',

                          onConfirm: () {
                            controller.deleteFee(
                              fee['id'],
                            );

                            Get.back();
                          },

                          textConfirm: 'Delete',
                          textCancel: 'Cancel',
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

      // ADD
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.studentId.clear();
          controller.amount.clear();
          controller.isPaid.value = false;

          feeDialog(controller, null);
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  // ADD / UPDATE DIALOG
  void feeDialog(
      FeeController controller,
      int? id,
      ) {
    Get.dialog(
      AlertDialog(
        title: Text(
          id == null ? 'Add Fee' : 'Update Fee',
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              controller: controller.studentId,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Student ID',
              ),
            ),

            TextField(
              controller: controller.amount,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),

            Obx(
                  () => SwitchListTile(
                title: Text(
                  controller.isPaid.value
                      ? 'Paid'
                      : 'Pending',
                ),

                value: controller.isPaid.value,

                onChanged: (value) {
                  controller.isPaid.value = value;
                },
              ),
            ),
          ],
        ),

        actions: [

          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),

          ElevatedButton(
            onPressed: () {

              if (id == null) {
                // ADD
                controller.addFee(
                  studentId: int.parse(
                    controller.studentId.text,
                  ),

                  amount: double.parse(
                    controller.amount.text,
                  ),

                  status: controller.isPaid.value
                      ? 'Paid'
                      : 'Pending',
                );
              } else {
                // UPDATE
                controller.updateFee(
                  id: id,

                  studentId: int.parse(
                    controller.studentId.text,
                  ),

                  amount: double.parse(
                    controller.amount.text,
                  ),

                  status: controller.isPaid.value
                      ? 'Paid'
                      : 'Pending',
                );
              }

              Get.back();
            },

            child: Text(
              id == null ? 'Add Fee' : 'Update',
            ),
          ),
        ],
      ),
    );
  }
}