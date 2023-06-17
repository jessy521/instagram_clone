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
}
