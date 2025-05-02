import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          // Profile Image
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=3', // Replace with your image or use AssetImage
            ),
          ),
          const SizedBox(height: 16),
          // Name
          const Text(
            'Sheikh Sukur Ali',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          // Email
          const Text(
            'sheikh.sukur@example.com',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
          // Profile Options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileTile(Icons.edit, "Edit Profile"),
                _buildProfileTile(Icons.lock, "Change Password"),
                _buildProfileTile(Icons.notifications, "Notifications"),
                _buildProfileTile(Icons.settings, "Settings"),
                _buildProfileTile(Icons.logout, "Logout", color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title, {Color? color}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.black),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle tap logic here
        },
      ),
    );
  }
}
