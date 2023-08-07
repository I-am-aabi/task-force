import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/product_text_controllers.dart';
import 'package:test_1/models/customer_model.dart';
import 'package:uuid/uuid.dart';

class CustomerController extends GetxController {
  RxList customerlist = [].obs;
  RxBool fetching = false.obs;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('customers');
  Customer? selectedCostumer;

  select(Customer data) {
    selectedCostumer = data;
  }

  @override
  onInit() {
    fetchCustomers();
    super.onInit();
  }

  addCustomer() async {
    Customer data = Customer(
        id: const Uuid().v4(),
        uid: 'asdf',
        name: AppTextControllers.namecontroller.text,
        adress: AppTextControllers.descriptioncontroller.text,
       
        phone: int.parse(AppTextControllers.pricecontroller.text));
    productCollection.doc().set(data.toJson());
    AppTextControllers.clear();
    await fetchCustomers();
  }

  fetchCustomers() async {
    final data = await productCollection.where('uid', isEqualTo: 'asdf').get();
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
        uid: 'asdf',
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
