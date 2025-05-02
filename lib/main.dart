import 'package:flutter/material.dart';
import 'package:flutter_app/screens/change_password_screen.dart';
import 'package:flutter_app/screens/edit_profile_screen.dart';
import 'package:flutter_app/screens/notifications_screen.dart';
import 'package:flutter_app/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';
import './screens/welcome_screen.dart';
import './screens/home_screen.dart';
import './auth/auth_provider.dart';
import './providers/user_provider.dart'; // ✅ New import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..checkAuthState()),
        ChangeNotifierProvider(create: (_) => UserProvider()), // ✅ Added
      ],
      child: Consumer<AuthProvider>(
        builder:
            (ctx, auth, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: lightMode,
              home:
                  auth.isAuthenticated
                      ? const HomeScreen()
                      : const WelcomeScreen(),
              initialRoute: "/",
              routes: {
                '/edit-profile': (ctx) => const EditProfileScreen(),
                '/change-password': (ctx) => const ChangePasswordScreen(),
                '/notifications': (ctx) => const NotificationsScreen(),
                '/settings': (ctx) => const SettingsScreen(),
              },
            ),
      ),
    );
  }
}
