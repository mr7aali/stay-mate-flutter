import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthProvider with ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  String? _token;
  String? _email;
  String? _role;
  String? _id;

  bool get isAuthenticated => _token != null;
  String? get token => _token;
  String? get email => _email;
  String? get role => _role;
  String? get id => _id;

  Future<void> login({
    required String id,
    required String email,
    required String role,
    required String accessToken,
  }) async {
    _token = accessToken;
    _email = email;
    _role = role;

    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'role', value: role);
    await _storage.write(key: 'id', value: id);

    notifyListeners();
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    _token = null;
    _email = null;
    _role = null;
    notifyListeners();
  }

  Future<void> checkAuthState() async {
    final id = await _storage.read(key: 'id');
    final email = await _storage.read(key: 'email');
    final role = await _storage.read(key: 'role');
    final token = await _storage.read(key: 'access_token');

    //
    if (id != null &&
        email != null &&
        role != null &&
        token != null &&
        !JwtDecoder.isExpired(token)) {
      _email = email;
      _role = role;
      _token = token;
      notifyListeners();
    } else if (token != null && JwtDecoder.isExpired(token)) {
      await logout(); // Clear expired token
    }
  }

  Future<Map<String, String>> getAuthHeaders() async {
    final token = await _storage.read(key: 'access_token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Map<String, dynamic> decodeToken() {
    if (token == null) return {};
    return JwtDecoder.decode(token!);
  }

  bool isTokenExpired() {
    if (token == null) return true;
    return JwtDecoder.isExpired(token!);
  }
}
