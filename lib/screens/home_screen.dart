import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_card.dart';
import 'package:flutter_app/widgets/custom_drawer.dart';
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
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
            onPressed: () async {
              await auth.logout();
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(
        // color: Colors.blueAccent,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 20),
              Text(
                'Accommodation Recommendations',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) => CustomCard(index: index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // evaluation: false,
        decoration: BoxDecoration(
          // color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          items: const [
            Icon(Icons.home),
            Icon(Icons.manage_search_rounded),
            Icon(Icons.bookmark_add_outlined),
            Icon(Icons.person_3),
          ],
          index: 0,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            // Handle navigation
          },
        ),
      ),
    );
  }
}
