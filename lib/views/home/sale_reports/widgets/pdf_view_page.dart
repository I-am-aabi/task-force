import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/views/home/sale_reports/widgets/share_options.dart';

class PdfViewPage extends StatelessWidget {
  PdfViewPage({super.key});
  final PdfController pdfController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Report'),
         actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => showShareOptions(context,pdfController.pdfpath.value),
          ),
        ],
      ),
      body: Obx(() {
        if (pdfController.pdfpath.value == 'loading') {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          
          return PDFView(
            filePath: pdfController.pdfpath.value,
            swipeHorizontal: true,
            autoSpacing: true,
            pageFling: true,
            defaultPage: 0,
            fitPolicy: FitPolicy.BOTH,
            // onPageChanged: (int page, int total) {
            //   // Handle page change here
            // },
          );
          
        }
      }),
    );
  }
}
