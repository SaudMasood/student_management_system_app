import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/feecontroller.dart';
import 'fee_report_screen.dart';

class FeeScreen extends StatelessWidget {
  const FeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      FeeController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fees'),
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
                        const FeeReportScreen(),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.assessment,
                  ),

                  label: const Text(
                    'Fee Report',
                  ),
                ),
              ),
            ),

            if (controller.fees.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No Fee Record',
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
                  controller.fees.length,

                  itemBuilder:
                      (context, index) {
                    final fee =
                    controller.fees[index];

                    return Card(
                      margin:
                      const EdgeInsets.only(
                        bottom: 8,
                      ),

                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            fee.studentId
                                .toString(),
                          ),
                        ),

                        title: Text(
                          'Student ID: '
                              '${fee.studentId}',
                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          'Amount: ${fee.amount}\n'
                              'Status: ${fee.status}',
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
                                    fee.studentId
                                        .toString();

                                controller
                                    .amountController
                                    .text =
                                    fee.amount
                                        .toString();

                                controller
                                    .isPaid
                                    .value =
                                    fee.status ==
                                        'Paid';

                                showFeeDialog(
                                  context,
                                  controller,
                                  fee.id,
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
                                  'Delete Fee',

                                  middleText:
                                  'Are you sure?',

                                  textCancel:
                                  'Cancel',

                                  textConfirm:
                                  'Delete',

                                  onConfirm: () {
                                    controller
                                        .deleteFee(
                                      fee.id,
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
      FloatingActionButton(
        onPressed: () {
          controller.clearFields();

          showFeeDialog(
            context,
            controller,
            null,
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }

  void showFeeDialog(
      BuildContext context,
      FeeController controller,
      int? id,
      ) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: Text(
            id == null
                ? 'Add Fee'
                : 'Update Fee',
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

              TextField(
                controller:
                controller
                    .amountController,

                keyboardType:
                TextInputType.number,

                decoration:
                const InputDecoration(
                  labelText: 'Amount',
                  border:
                  OutlineInputBorder(),
                ),
              ),

              Obx(
                    () => SwitchListTile(
                  title: Text(
                    controller.isPaid.value
                        ? 'Paid'
                        : 'Pending',
                  ),

                  value:
                  controller.isPaid.value,

                  onChanged: (value) {
                    controller
                        .isPaid
                        .value = value;
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
                      .addFee();
                } else {
                  await controller
                      .updateFee(id);
                }

                Navigator.pop(context);
              },

              child: Text(
                id == null
                    ? 'Add Fee'
                    : 'Update',
              ),
            ),
          ],
        );
      },
    );
  }
}