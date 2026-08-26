import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/feecontroller.dart';

class FeeReportScreen extends StatelessWidget {
  const FeeReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeeController>();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Fee Report',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Obx(() {
        return ListView(
          padding: const EdgeInsets.all(16),

          children: [
            const Text(
              'Fee Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Overview of student fee records',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 4,

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(16),

                leading: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                  Colors.blue.shade100,

                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.blue,
                  ),
                ),

                title: const Text(
                  'Total Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  'All fee records',
                ),

                trailing: Text(
                  controller.totalAmount
                      .toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 4,

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(16),

                leading: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                  Colors.green.shade100,

                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),

                title: const Text(
                  'Paid Fees',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  'Number of paid fees',
                ),

                trailing: Text(
                  controller.paidFees
                      .toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 4,

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(16),

                leading: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                  Colors.teal.shade100,

                  child: const Icon(
                    Icons.payments,
                    color: Colors.teal,
                  ),
                ),

                title: const Text(
                  'Paid Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  'Total amount received',
                ),

                trailing: Text(
                  controller.paidAmount
                      .toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 4,

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(16),

                leading: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                  Colors.orange.shade100,

                  child: const Icon(
                    Icons.pending,
                    color: Colors.orange,
                  ),
                ),

                title: const Text(
                  'Pending Fees',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  'Number of pending fees',
                ),

                trailing: Text(
                  controller.pendingFees
                      .toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 4,

              child: ListTile(
                contentPadding:
                const EdgeInsets.all(16),

                leading: CircleAvatar(
                  radius: 27,
                  backgroundColor:
                  Colors.red.shade100,

                  child: const Icon(
                    Icons.money_off,
                    color: Colors.red,
                  ),
                ),

                title: const Text(
                  'Pending Amount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text(
                  'Amount still pending',
                ),

                trailing: Text(
                  controller.pendingAmount
                      .toString(),

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}