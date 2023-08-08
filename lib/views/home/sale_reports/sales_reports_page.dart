import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';
import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/sale_reports/widgets/costumer_select.dart';
import 'package:test_1/views/home/sale_reports/widgets/date_select.dart';
import 'package:test_1/views/home/sale_reports/widgets/pdf_view_page.dart';
import 'package:test_1/views/home/sale_reports/widgets/product%20_select_popup.dart';
import 'package:test_1/views/home/styles_constants.dart/colors.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';

class SalesReportsPage extends StatelessWidget {
  SalesReportsPage({super.key});
  final PdfController pdfController = Get.find();
  final TransactionController transactionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reports',
              style: TextStylesCollection.headingstyle(),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: ()  {
                  productSelect(context);
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.getcolor(0),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Make report by product',
                    style: TextStylesCollection.productNamestyle(),
                  )),
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () =>dateSelectPopup(context),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.getcolor(1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Make report by date',
                    style: TextStylesCollection.productNamestyle(),
                  )),
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () =>customerSelect(context),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.getcolor(2),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Make report by customer',
                    style: TextStylesCollection.productNamestyle(),
                  )),
                )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () async{
                   Get.to(() => PdfViewPage());
                pdfController.resetPath();
                await transactionController.fetchAllTransaction();
                await pdfController.generateAllTransactionReport(
                    transactionController.transactionlist);
                AppTextControllers.clear();
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: AppColors.getcolor(3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Make report for all transactions',
                    style: TextStylesCollection.productNamestyle(),
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
