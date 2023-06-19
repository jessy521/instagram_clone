import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String bio;
  final String photoUrl;
  final String uid;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.uid,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "bio": bio,
        "photoUrl": photoUrl,
        "uid": uid,
        "followers": followers,
        "following": following
      };

  static User fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot['username'],
        email: snapshot['email'],
        bio: snapshot['bio'],
        photoUrl: snapshot['photoUrl'],
        uid: snapshot['uid'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
