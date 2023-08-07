import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/transaction_controller.dart';
import 'package:test_1/views/styles_constants.dart/colors.dart';

void deleteTransaction(BuildContext context) {
  final TransactionController transactionController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Delete Transaction')),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Are you sure you want to delete this transaction')],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await transactionController.deleteDocumentByUid();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}
