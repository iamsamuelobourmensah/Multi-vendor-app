import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_app/model/category_model.dart';

class CategoryController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    _firebaseFirestore
        .collection("category")
        .snapshots()
        .listen((QuerySnapshot querysnapshot) {
      categories.assignAll(
        querysnapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return CategoryModel(
              categoryName: data["categoryName"],
              categoryImage: data["categoryImage"]);
        }).toList(),
      );
    });
  }
}
