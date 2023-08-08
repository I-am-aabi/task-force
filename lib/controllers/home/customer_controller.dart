import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';

import 'package:test_1/models/customer_model.dart';
import 'package:uuid/uuid.dart';

class CustomerController extends GetxController {
  RxList customerlist = [].obs;
  RxBool fetching = false.obs;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('customers');
  Customer? selectedCostumer;
  RxString customerName = 'Select a customer'.obs;
  User? user = FirebaseAuth.instance.currentUser;
  RxInt customerscount = 0.obs;
  select(Customer data) {
    selectedCostumer = data;
    customerName.value = selectedCostumer!.name;
  }

  @override
  onInit() async {
    await fetchCustomers();
    customerscount.value = customerlist.length;
    super.onInit();
  }

  addCustomer() async {
    Customer data = Customer(
        id: const Uuid().v4(),
        uid: user!.uid,
        name: AppTextControllers.namecontroller.text,
        adress: AppTextControllers.descriptioncontroller.text,
        phone: int.parse(AppTextControllers.pricecontroller.text));
    productCollection.doc().set(data.toJson());
    AppTextControllers.clear();
    await fetchCustomers();
  }

  fetchCustomers() async {
    final data =
        await productCollection.where('uid', isEqualTo: user!.uid).get();
    List<Customer> productsList = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return Customer.fromJson(productData);
    }).toList();
    customerlist.value = productsList;
    fetching.value = true;
  }

  Future<void> deleteDocumentByUid() async {
    try {
      QuerySnapshot querySnapshot = await productCollection
          .where('id', isEqualTo: selectedCostumer!.id)
          .get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.delete();
        await fetchCustomers();
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }

  Future<void> editDocumentByUid() async {
    Customer data = Customer(
        id: selectedCostumer!.id,
        uid: user!.uid,
        name: AppTextControllers.namecontroller.text,
        adress: AppTextControllers.descriptioncontroller.text,
        phone: int.parse(AppTextControllers.pricecontroller.text));
    try {
      QuerySnapshot querySnapshot = await productCollection
          .where('id', isEqualTo: selectedCostumer!.id)
          .get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.set(data.toJson());
        await fetchCustomers();
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }
}
