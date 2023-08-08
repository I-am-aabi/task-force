import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';



import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/inventory/widgets/product_card.dart';
import 'package:test_1/views/home/sale_reports/widgets/pdf_view_page.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

void productSelect(BuildContext context) {
  final TransactionController transactionController = Get.find();
  final ProductController productController = Get.find();
  final PdfController pdfController = Get.find();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Select Product')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
                Get.to(() => PdfViewPage());
                pdfController.resetPath();
                await transactionController.fetchTransactionbyname();
                await pdfController.generateAllTransactionReport(
                    transactionController.transactionlist);
                AppTextControllers.clear();
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
