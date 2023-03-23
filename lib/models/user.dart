class User {
  final String username;
  final String uid;
  final String email;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  User(
    this.username,
    this.uid,
    this.email,
    this.photoUrl,
    this.bio,
    this.followers,
    this.following,
  );
}
