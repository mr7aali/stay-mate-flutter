import 'package:flutter/material.dart';
import 'package:flutter_app/screens/bookmark_screen.dart';
import 'package:flutter_app/screens/change_password_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:flutter_app/widgets/custom_drawer.dart';
import 'package:flutter_app/widgets/custom_navigation_bar.dart';
import 'package:flutter_app/widgets/home_content_page.dart';
import 'package:provider/provider.dart';
import '../auth/auth_provider.dart';
// import 'welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeContentPage(),
    const ChangePasswordScreen(),
    const BookmarksScreen(),
    const ProfileScreen(),
  ];
  final List<String> _titles = [
    'Find Accommodation',
    'Search',
    'Bookmarks',
    'Profile',
  ];

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   final auth = Provider.of<AuthProvider>(context, listen: false);

  //   if (auth.token == null || auth.token!.isEmpty || auth.isTokenExpired()) {
  //     Future.microtask(() async {
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => const WelcomeScreen()),
  //         (route) => false,
  //       );
  //     });
  //   }
  //   print("Home page");
  // }
  // @overri?de
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   final auth = Provider.of<AuthProvider>(context, listen: false);

  //   if (auth.token == null || auth.token!.isEmpty || auth.isTokenExpired()) {
  //     Future.microtask(() async {
  //       await auth.logout(); // Clear storage and token
  //       if (!mounted) return;
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (_) => const WelcomeScreen()),
  //         (route) => false,
  //       );
  //     });
  //   }
  // }

  void _checkAuthAndRedirect() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    if (auth.token == null || auth.token!.isEmpty || auth.isTokenExpired()) {
      await auth.logout();
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignInScreen()),
        (route) => false,
      );
    }
  }

  //  MaterialPageRoute(
  //                             builder: (context) => SignInScreen(),
  //                           ),

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        forceMaterialTransparency: false,
        // leading: Builder(
        //   builder:
        //       (context) => IconButton(
        //         icon: const Icon(Icons.menu, color: Colors.white),
        //         onPressed: () {
        //           Scaffold.of(context).openDrawer();
        //         },
        //       ),
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            tooltip: 'Logout',
            onPressed: () async {
              await auth.logout();
            },
          ),
        ],
      ),
      // drawer: CustomDrawer(),
      body: _screens[_selectedIndex], // ← Switch between pages

      bottomNavigationBar: CustomBottomNav_Bar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          _checkAuthAndRedirect();
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
