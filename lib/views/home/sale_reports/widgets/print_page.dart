
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';

class PrintPage extends StatelessWidget {
   PrintPage({super.key,});
  final PdfController pdfController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PdfPreview(
        build: (format) => pdfController.pdfdata!,
      )),
    );
  }
}
