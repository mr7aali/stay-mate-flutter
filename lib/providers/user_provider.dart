import 'package:flutter/foundation.dart';
import '../models/user.dart';

// admin, manager, user
class UserProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  UserProvider() {
    // Default to user role
    _user = User(
      name: 'Sheikh Sukur Ali',
      email: 'sheikh.sukur@example.com',
      profileImageUrl: 'https://i.pravatar.cc/150?img=3',
      role: 'user',
    );
  }

  void loginWithEmail(String email, {String? name, String? profileImageUrl}) {
    String role = 'user';
    if (email == 'admin@gmail.com') {
      role = 'admin';
    } else if (email == 'manager@gmail.com') {
      role = 'manager';
    }
    _user = User(
      name: name ?? 'Sheikh Ali - $role',
      email: email,
      profileImageUrl: profileImageUrl ?? 'https://i.pravatar.cc/150?u=$role',
      role: role,
    );
    notifyListeners();
  }

  void updateUser({String? name, String? email, String? profileImageUrl}) {
    if (name != null) _user.name = name;
    if (email != null) _user.email = email;
    if (profileImageUrl != null) _user.profileImageUrl = profileImageUrl;
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _user.notificationsEnabled = value;
    notifyListeners();
  }
}
