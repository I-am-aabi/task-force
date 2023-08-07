import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/product_data_controller.dart';

void deletePopup(BuildContext context) {
  final ProductController productController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(child: Text('Delete Product')),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Are you sure you want to delete this product')],
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
                await productController.deleteDocumentByUid();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}
