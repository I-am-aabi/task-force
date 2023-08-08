import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';

import 'package:test_1/controllers/home/product_text_controllers.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void editCustomer(BuildContext context) {
  final CustomerController customerController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Edit Transaction')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: AppTextControllers.namecontroller,
                decoration: InputDecoration(
                    labelText: 'Name',
                    focusColor: AppColors.colorcyan,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorcyan))),
                cursorColor: AppColors.colorcyan,
                onChanged: (value) =>
                    value = AppTextControllers.namecontroller.text,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: AppTextControllers.namecontroller,
                decoration: InputDecoration(
                    labelText: 'Adress',
                    focusColor: AppColors.colorcyan,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorcyan))),
                cursorColor: AppColors.colorcyan,
                onChanged: (value) =>
                    value = AppTextControllers.descriptioncontroller.text,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: AppTextControllers.pricecontroller,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    focusColor: AppColors.colorred,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorred))),
                cursorColor: AppColors.colorred,
                onChanged: (value) => AppTextControllers.pricecontroller.text,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                AppTextControllers.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                customerController.editDocumentByUid();
                // transactionController.addTransaction();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      });
}
