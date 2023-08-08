import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/views/home/sale_reports/widgets/print_page.dart';

void showShareOptions(BuildContext context, String path) {
  final PdfController pdfController = Get.find();
  // shareGmail() async {
  
  //   Share.shareXFiles([XFile(pdfController.pdfpath.value)]);
  // }
  printpdf() {
    Get.to(() => PrintPage());
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Share via Gmail'),
            onTap: () {
              // shareGmail();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_chart),
            title: const Text('Convert to Excel'),
            onTap: () {
              // _convertToExcel();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text('Print PDF'),
            onTap: () {
              // Get.to(PrintPage());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrintPage(),
                  ));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
