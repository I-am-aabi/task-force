import 'dart:typed_data';

import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfController extends GetxController {
  RxString pdfpath = 'loading'.obs;
  RxBool isReportempty = false.obs;
   Uint8List? pdfdata = null;
  resetPath() {
    pdfpath.value = 'loading';
    isReportempty.value = false;
  }

  Future<void> generateAllTransactionReport(List<dynamic> transactions) async {
    final pdf = pw.Document();
   
    final headers = ['Name', 'Date', 'Product', 'Price', 'Count', 'Total'];

    final rows = transactions.map((transaction) {
      return [
        transaction.name,
        transaction.date,
        transaction.product,
        transaction.amount.toString(),
        transaction.count,
        transaction.total
      ];
    }).toList();

    List<dynamic> totalValues =
        transactions.map((transaction) => transaction.total).toList();
    double totalSum = totalValues.fold(
        0, (previousValue, element) => previousValue + element);

    // Add a new row to show the sum of 'Total' values
    rows.add([
      'Total Sum',
      '',
      '',
      '',
      '',
      totalSum.toString(),
    ]);
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 20),
              child: pw.Text(
                'Transaction Report',
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
            ),
            pw.TableHelper.fromTextArray(
              context: context,
              data: [headers, ...rows],
              border: null,
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              headerHeight: 25,
              cellHeight: 30,
              cellAlignments: {0: pw.Alignment.centerLeft},
              cellStyle: const pw.TextStyle(fontSize: 14),
              headerStyle:
                  pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
            ),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 20),
              child: pw.Text(
                'Total Sum: $totalSum',
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/transaction_report.pdf';
    final file = File(path);
    pdfdata = await pdf.save();
    await file.writeAsBytes(pdfdata!);

    if (rows.length == 1) {
      isReportempty.value = true;
    }
    pdfpath.value = path;
  }
}
