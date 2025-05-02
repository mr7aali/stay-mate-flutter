import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              'assets/images/profile.jpg',
            ), // Replace with real image
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Sheikh Sukur Ali',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              'Web Software Engineer',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.arrow_forward_ios),
            // onTap: () => _navigate(context, const EditProfileScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios),
            // onTap: () => _navigate(context, const ChangePasswordScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            // onTap: () => _navigate(context, const SettingsScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            trailing: const Icon(Icons.arrow_forward_ios),
            // onTap: () => _navigate(context, const LogoutScreen()),
          ),
        ],
      ),
    );
  }
}
