import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/bookmark_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';
import 'package:flutter_app/widgets/custom_drawer.dart';
import 'package:flutter_app/widgets/home_content_page.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeContentPage(),
    const SearchScreen(),
    const BookmarksScreen(),
    const ProfileScreen(),
  ];

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
      body: _screens[_selectedIndex], // ← Switch between pages

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
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
          index: _selectedIndex,

          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            // Handle navigation
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
