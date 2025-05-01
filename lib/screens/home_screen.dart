import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (auth.token == null || auth.token!.isEmpty) {
      // Redirect to WelcomeScreen
      Future.microtask(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
          (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await auth.logout();
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (_) => const WelcomeScreen()),
              //   (route) => false,
              // );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${auth.email ?? "User"}!'),
            const SizedBox(height: 16),
            Text('Role: ${auth.role ?? "N/A"}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Authenticated API call placeholder
              },
              child: const Text('Make Authenticated Request'),
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     await auth.logout();
            //     Navigator.of(context).pushAndRemoveUntil(
            //       MaterialPageRoute(builder: (_) => const WelcomeScreen()),
            //       (route) => false,
            //     );
            //   },
            //   child: const Text('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
