import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> registerNewScreen(
      String email, String fullName, String password) async {
    String res = "Opps something went wrong";

    try {
      // we will first create user account in the auth tab after then cloud firestore
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      res = "Success";
      await _firebaseFirestore
          .collection("buyers")
          .doc(userCredential.user!.uid)
          .set({
        "fullName": fullName,
        'profileImage': '',
        "email": email,
        'pinCode': '',
        'userId': userCredential.user!.uid,
        'locallity': "",
        "city": "",
        "state": "",
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
    res=    'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
 res = 'The account already exists for that email.';
      }
    } catch (e) {}
    return res;
  }

  // LOGIN USER
  Future<String> loginUser(String email, String password) async {
    String res = "Somethig went wrong";

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    }
    on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    res = 'No user found for that email.';
  } else if (e.code == 'wrong-password') {
    res = 'Wrong password provided for that user.';
  }
}
     catch (e) {
      res = e.toString();
    }
    return res;
  }
}
