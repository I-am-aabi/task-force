import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/customer_controller.dart';
import 'package:test_1/controllers/product_text_controllers.dart';
import 'package:test_1/views/styles_constants.dart/colors.dart';

void addCustomer(BuildContext context) {
  final CustomerController customerController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Add Customer')),
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
                    keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: AppTextControllers.descriptioncontroller,
                decoration: InputDecoration(
                    labelText: 'Adress',
                    focusColor: AppColors.colorred,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorred))),
                cursorColor: AppColors.colorred,
                onChanged: (value) =>
                    AppTextControllers.descriptioncontroller.text,
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: AppTextControllers.pricecontroller,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
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
                // transactionController.addTransaction();
                customerController.addCustomer();
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
