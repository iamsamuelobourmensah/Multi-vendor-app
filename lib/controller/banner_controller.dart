import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BannerController extends GetxController {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  Stream<List<String>> getBannerUrl() {
    return _firebaseStore.collection("banners").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc["image"] as String).toList();
    });
  }
}
