import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';


void emptyStock(BuildContext context) {
  final ProductController productController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(child: Text('Out of Stock')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'The product ${productController.selectedProduct!.name} Is only ${productController.selectedProduct!.stock} in Stock try adding more Stock or use lesser count in transaction')
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await productController.deleteDocumentByUid();
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
