// import 'package:flutter/material.dart';
// import '../theme/theme.dart';
// import './screens/welcome_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: lightMode,
//       home: const WelcomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';
import './screens/welcome_screen.dart';
import './auth/auth_provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..checkAuthState(),
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
            ),
      ),
    );
  }
}
