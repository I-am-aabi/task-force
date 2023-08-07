// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_1/controllers/pdf_controller.dart';
// import 'package:test_1/controllers/product_text_controllers.dart';
// import 'package:test_1/controllers/transaction_controller.dart';
// import 'package:test_1/models/transaction_model.dart';
// import 'package:test_1/views/sale_reports/widgets/pdf_view_page.dart';
// import 'package:test_1/views/sales/widgets/delete_transaction.dart';
// import 'package:test_1/views/sales/widgets/edit_transaction.dart';
// import 'package:test_1/views/styles_constants.dart/colors.dart';

// void viewTransaction(BuildContext context) {
//   final TransactionController transactionController = Get.find();
//   final PdfController pdfController = Get.find();
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: AppColors.popupBackground,
//           title: Center(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     AppTextControllers.presetTrasaction(
//                         transactionController.selectedTransaction!);
//                     editTransaction(context);
//                   },
//                   icon: const Icon(Icons.edit)),
//               const Text('Transaction'),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     deleteTransaction(context);
//                   },
//                   icon: const Icon(Icons.delete))
//             ],
//           )),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Customer Name: '),
//                   Text(transactionController.selectedTransaction!.name)
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Transaction Date: '),
//                   Text(transactionController.selectedTransaction!.date
//                       .toString())
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('Transaction Amount: '),
//                   Text(transactionController.selectedTransaction!.amount
//                       .toString())
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(PdfViewPage());
//                 final List<Transactionsale> transactions = [];
//                 transactions.add(transactionController.selectedTransaction!);
//                 pdfController.generateAllTransactionReport(transactions);
//               },
//               child: const Text('Create Report'),
//             ),
//           ],
//         );
//       });
// }
