import 'package:flutter/material.dart';
import '../widgets/user_card.dart';

class User {
  final String name;
  final String email;
  final String role;
  final String avatarUrl;

  User({
    required this.name,
    required this.email,
    required this.role,
    required this.avatarUrl,
  });
}

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User> users = [
    User(
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'User',
      avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
    ),
    User(
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      role: 'User',
      avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    ),
    User(
      name: 'Mike Johnson',
      email: 'mike.johnson@example.com',
      role: 'User',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
    ),
  ];

  void _showManageDialog(BuildContext context, User user, int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Manage ${user.name}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Change Role'),
                  onTap: () {
                    // Implement role change logic
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Delete User'),
                  onTap: () {
                    setState(() {
                      users.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            users.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/user_not_found.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No users found!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Add users to manage them.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
                : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Dismissible(
                      key: ValueKey(user.email),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          users.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          // height: 90,
                          width: double.infinity,
                          child: UserCard(
                            name: user.name,
                            email: user.email,
                            role: user.role,
                            avatarUrl: user.avatarUrl,
                            onManage:
                                () => _showManageDialog(context, user, index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
