import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/profile_tile.dart';
import '../screens/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(user.email, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            user.role.toUpperCase(),
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                ProfileTile(
                  icon: Icons.edit,
                  title: 'Edit Profile',
                  route: '/edit-profile',
                ),
                ProfileTile(
                  icon: Icons.lock,
                  title: 'Change Password',
                  route: '/change-password',
                ),
                ProfileTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  route: '/notifications',
                ),
                ProfileTile(
                  icon: Icons.settings,
                  title: 'Settings',
                  route: '/settings',
                ),
                ProfileTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  color: Colors.red,
                  onTap: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
