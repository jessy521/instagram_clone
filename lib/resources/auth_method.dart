import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _fireStore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnapshot(snap);
  }

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

        model.User user = model.User(
            uid: cred.user!.uid,
            username: userName,
            email: email,
            bio: bio,
            followers: [],
            following: [],
            photoUrl: photoUrl);

        await _fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      } else {
        res = "Please check out all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "pls enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "enter an email";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
