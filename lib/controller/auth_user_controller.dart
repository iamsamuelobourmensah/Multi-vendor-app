import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> registerNewScreen(
      String email, String fullName, String password) async {
    String res = "Opps something went wrong";

    try {
      // we will first create user account in the auth tab after then cloud firestore
     UserCredential  userCredential =  await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "Success";
await _firebaseFirestore.collection("buyers").doc(userCredential.user!.uid).set(
{
  "fullName":fullName,
  'profileImage': '',
  "email":email,
  'pinCode': '',
  'userId':userCredential.user!.uid,
  'locallity':"",
  "city":"",
  "state":"",
}


);

    } catch (e) {}
    return res;
  }
}
