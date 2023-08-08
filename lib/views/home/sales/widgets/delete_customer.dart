import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';
import 'package:test_1/controllers/home/transaction_controller.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void deleteCustomer(BuildContext context) {
  final CustomerController customerController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Delete Customer')),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Are you sure you want to delete this customer')],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Navigator.of(context).pop();
                Get.back();
                await customerController.deleteDocumentByUid();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}
