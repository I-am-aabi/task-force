import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/pdf_controller.dart';

class PdfViewPage extends StatelessWidget {
  PdfViewPage({super.key});
  final PdfController pdfController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Report'),
      ),
      body: Obx(
        () => pdfController.pdfpath.value == 'loading'
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PDFView(
                filePath: pdfController.pdfpath.value,
                swipeHorizontal: true,
                autoSpacing: true,
                pageFling: true,
                defaultPage: 0,
                fitPolicy: FitPolicy.BOTH,
                // onPageChanged: (int page, int total) {
                //   // Handle page change here
                // },
              ),
      ),
    );
  }
}
