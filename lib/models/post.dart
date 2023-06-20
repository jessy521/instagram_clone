import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String description;
  final String postId;
  final String postUrl;
  final String uid;
  final datePublished;
  final String profileImage;
  final likes;

  const Post(
      {required this.username,
      required this.description,
      required this.postUrl,
      required this.postId,
      required this.uid,
      required this.datePublished,
      required this.profileImage,
      required this.likes});

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "likes": likes,
        "postUrl": postUrl
      };

  static Post fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot['description'],
        username: snapshot['username'],
        postId: snapshot['postId'],
        datePublished: snapshot['datePublished'],
        uid: snapshot['uid'],
        profileImage: snapshot['profileImage'],
        likes: snapshot['likes'],
        postUrl: snapshot['postUrl']);
  }
}
