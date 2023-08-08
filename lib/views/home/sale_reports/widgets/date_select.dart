import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/date_controller.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';

import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/sale_reports/widgets/pdf_view_page.dart';
import 'package:test_1/views/home/styles_constants.dart/colors.dart';
void dateSelectPopup(BuildContext context) {
  final TransactionController transactionController = Get.find();
  final DateController dateController = Get.find();
  final PdfController pdfController = Get.find();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Select a Date ')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                await transactionController.fetchTransactionbydate();
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
