import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  final User _user = User(
    name: 'Sheikh Sukur Ali',
    email: 'sheikh.sukur@example.com',
    profileImageUrl: 'https://i.pravatar.cc/150?img=3',
  );

  User get user => _user;

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
