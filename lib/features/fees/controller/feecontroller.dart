import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../database/database_helper.dart';
import '../model/fee_model.dart';

class FeeController extends GetxController {
  final DatabaseHelper db = DatabaseHelper();

  final fees = <FeeModel>[].obs;

  final isLoading = false.obs;

  final studentIdController =
  TextEditingController();

  final amountController =
  TextEditingController();

  final isPaid = false.obs;

  @override
  void onInit() {
    super.onInit();

    getFees();
  }

  Future<void> getFees() async {
    isLoading.value = true;

    await db.initDatabase();

    final data = await db.getFees();

    fees.assignAll(
      data.map(
            (item) => FeeModel.fromJson(item),
      ),
    );

    isLoading.value = false;
  }

  Future<void> addFee() async {
    if (studentIdController.text.isEmpty ||
        amountController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Fill all fields',
      );

      return;
    }

    await db.addFee(
      studentId:
      int.parse(studentIdController.text),

      amount:
      double.parse(amountController.text),

      status:
      isPaid.value ? 'Paid' : 'Pending',
    );

    clearFields();

    await getFees();
  }

  Future<void> updateFee(int id) async {
    await db.updateFee(
      id: id,

      studentId:
      int.parse(studentIdController.text),

      amount:
      double.parse(amountController.text),

      status:
      isPaid.value ? 'Paid' : 'Pending',
    );

    clearFields();

    await getFees();
  }

  Future<void> deleteFee(int id) async {
    await db.deleteFee(id);

    await getFees();
  }

  void clearFields() {
    studentIdController.clear();
    amountController.clear();

    isPaid.value = false;
  }

  int get paidFees {
    return fees
        .where((fee) => fee.status == 'Paid')
        .length;
  }

  int get pendingFees {
    return fees
        .where((fee) => fee.status == 'Pending')
        .length;
  }

  double get totalAmount {
    double total = 0;

    for (var fee in fees) {
      total += fee.amount;
    }

    return total;
  }

  double get paidAmount {
    double total = 0;

    for (var fee in fees) {
      if (fee.status == 'Paid') {
        total += fee.amount;
      }
    }

    return total;
  }

  double get pendingAmount {
    double total = 0;

    for (var fee in fees) {
      if (fee.status == 'Pending') {
        total += fee.amount;
      }
    }

    return total;
  }

  @override
  void onClose() {
    studentIdController.dispose();
    amountController.dispose();

    super.onClose();
  }
}