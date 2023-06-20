import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
  Future<String> uploadImage(String description, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "some error occurred!";
    try {
      String photoUrl =
          await StorageMethods().uploadImageStorage('posts', file, true);

      String postId = const Uuid().v1();
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          profileImage: profileImage,
          likes: [],
          postUrl: photoUrl);

      _firebaseStore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}