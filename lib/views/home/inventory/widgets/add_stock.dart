import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';


import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void addStockPopup(BuildContext context) {
  final ProductController productController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Add Stock')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter the number of stock to add'),
              const SizedBox(height: 16),
              TextField(
                controller: AppTextControllers.pricecontroller,
                decoration: InputDecoration(
                    labelText: 'No:of Stock',
                    focusColor: AppColors.colorgreen,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorgreen))),
                cursorColor: AppColors.colorgreen,
                keyboardType: TextInputType.number,
                onChanged: (value) => AppTextControllers.pricecontroller.text,
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
              onPressed: ()async {
                Get.back();
               await productController.increaseStock();
                
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
