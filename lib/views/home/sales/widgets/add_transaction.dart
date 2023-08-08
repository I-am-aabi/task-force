import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/date_controller.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';



import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/inventory/widgets/product_card.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

void addTransaction(BuildContext context) {
  final TransactionController transactionController = Get.find();
  final DateController dateController = Get.find();
  final ProductController productController = Get.find();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Add Transaction')),
          content: ListView(
            children: [
              SizedBox(
                height: 300,
                child: Obx(
                  () {
                    if (!productController.fetching.value) {
                      return const LoadingAnimation();
                    } else {
                      if (productController.productlist.isEmpty) {
                        return const NodataAnimation();
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: productController.productlist[index],
                                istransaction: true,
                                index: index);
                          },
                          itemCount: productController.productlist.length,
                        );
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      productController.productname.value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Obx(() => InkWell(
                    onTap: () async => await dateController.selectDate(context),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(dateController.date.value)
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: AppTextControllers.pricecontroller,
                decoration: InputDecoration(
                    labelText: 'Count',
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
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Get.back();
                await transactionController.addTransaction(context);
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
