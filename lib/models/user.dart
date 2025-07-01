class User {
  String name;
  String email;
  String profileImageUrl;
  bool notificationsEnabled;
  String role;

  User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
    this.notificationsEnabled = true,
    required this.role,
  });
}
