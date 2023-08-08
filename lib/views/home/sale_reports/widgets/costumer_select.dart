import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';


import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/customers/widgets/customer_card.dart';
import 'package:test_1/views/home/sale_reports/widgets/pdf_view_page.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

void customerSelect(BuildContext context) {
  final TransactionController transactionController = Get.find();
  final CustomerController customerController = Get.find();
  final PdfController pdfController = Get.find();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Select Customer')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300,
                child: Obx(
                  () {
                    if (!customerController.fetching.value) {
                      return const LoadingAnimation();
                    } else {
                      if (customerController.customerlist.isEmpty) {
                        return const NodataAnimation();
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return CustomerCard(
                                customer:
                                    customerController.customerlist[index],
                                index: index,
                                isSelection: true,);
                          },
                          itemCount: customerController.customerlist.length,
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
                      customerController.customerName.value
                         ,
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
                await transactionController.fetchTransactionbycustomer();
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
