import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/product_data_controller.dart';
import 'package:test_1/controllers/product_text_controllers.dart';
import 'package:test_1/views/inventory/widgets/add_stock.dart';
import 'package:test_1/views/inventory/widgets/delete_popup.dart';
import 'package:test_1/views/inventory/widgets/edit_popup.dart';
import 'package:test_1/views/styles_constants.dart/colors.dart';
import 'package:test_1/views/styles_constants.dart/styles.dart';

void viewProduct(BuildContext context) {
  final ProductController productController = Get.find();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                    AppTextControllers.clear();
                    addStockPopup(context);
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.getcolor(0),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Add Stock',
                      style: TextStylesCollection.productNamestyle,
                    )),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                    AppTextControllers.preset(
                        productController.selectedProduct!);
                    editPopup(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.getcolor(1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Edit Product',
                      style: TextStylesCollection.productNamestyle,
                    )),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                    deletePopup(context);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.getcolor(2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Delete Product',
                      style: TextStylesCollection.productNamestyle,
                    )),
                  )),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.getcolor(3),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'Cancel',
                      style: TextStylesCollection.productNamestyle,
                    )),
                  )),
            ],
          ),
        );
      });
}
