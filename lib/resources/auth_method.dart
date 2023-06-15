import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String userName,
      required String email,
      required String password,
      required String bio,
      required Uint8List? file}) async {
    String res = "";
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          bio.isNotEmpty &&
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageStorage('profilePic', file, false);
        // print(photoUrl);

        await _fireStore.collection('users').doc(cred.user!.uid).set({
          "username": userName,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": [],
          "file": photoUrl
        });
        res = "success";
      } else {
        res = "Please check out all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
