import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';


import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void editPopup(BuildContext context) {
  final ProductController productController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(child: Text('Edit Product')),
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
              const SizedBox(height: 16),
              TextField(
                controller: AppTextControllers.descriptioncontroller,
                decoration: InputDecoration(
                    labelText: 'Description',
                    focusColor: AppColors.coloryellow,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.coloryellow))),
                cursorColor: AppColors.coloryellow,
                onChanged: (value) =>
                    value = AppTextControllers.descriptioncontroller.text,
              ),
              TextField(
                controller: AppTextControllers.pricecontroller,
                decoration: InputDecoration(
                    labelText: 'Price',
                    focusColor: AppColors.colorred,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorred))),
                cursorColor: AppColors.colorred,
                onChanged: (value) => AppTextControllers.pricecontroller.text,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: AppTextControllers.stockcontroller,
                decoration: InputDecoration(
                    labelText: 'No:of Stock',
                    focusColor: AppColors.colorgreen,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.colorgreen))),
                cursorColor: AppColors.colorgreen,
                keyboardType: TextInputType.number,
                onChanged: (value) => AppTextControllers.stockcontroller.text,
              ),
            ],
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
                await productController.editDocumentByUid();
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
