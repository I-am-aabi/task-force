// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_1/controllers/date_controller.dart';

// import 'package:test_1/controllers/product_text_controllers.dart';
// import 'package:test_1/controllers/transaction_controller.dart';

// import 'package:test_1/views/styles_constants.dart/colors.dart';

// void editTransaction(BuildContext context) {
//   final TransactionController transactionController = Get.find();
//   final DateController dateController = Get.find();
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: AppColors.popupBackground,
//           title: const Center(child: Text('Edit Transaction')),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: AppTextControllers.namecontroller,
//                 decoration: InputDecoration(
//                     labelText: 'Name',
//                     focusColor: AppColors.colorcyan,
//                     focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.colorcyan))),
//                 cursorColor: AppColors.colorcyan,
//                 onChanged: (value) =>
//                     value = AppTextControllers.namecontroller.text,
//               ),
//               const SizedBox(height: 30),
//               Obx(() => InkWell(
//                     onTap: () async => await dateController.selectDate(context),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.calendar_month),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(dateController.date.value)
//                       ],
//                     ),
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: AppTextControllers.pricecontroller,
//                 decoration: InputDecoration(
//                     labelText: 'Amount',
//                     focusColor: AppColors.colorred,
//                     focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.colorred))),
//                 cursorColor: AppColors.colorred,
//                 onChanged: (value) => AppTextControllers.pricecontroller.text,
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 16),
//               // TextField(
//               //   controller: AppTextControllers.stockcontroller,
//               //   decoration: InputDecoration(
//               //       labelText: 'No:of Stock',
//               //       focusColor: AppColors.colorgreen,
//               //       focusedBorder: UnderlineInputBorder(
//               //           borderSide: BorderSide(color: AppColors.colorgreen))),
//               //   cursorColor: AppColors.colorgreen,
//               //   keyboardType: TextInputType.number,
//               //   onChanged: (value) => AppTextControllers.stockcontroller.text,
//               // ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 AppTextControllers.clear();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 transactionController.editDocumentByUid();
//                 // transactionController.addTransaction();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       });
// }
