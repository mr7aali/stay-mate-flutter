import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English';
  bool _isDarkTheme = false;

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            title: const Text('Select Language'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  setState(() => _selectedLanguage = 'English');
                  Navigator.pop(context);
                },
                child: const Text('English'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() => _selectedLanguage = 'Spanish');
                  Navigator.pop(context);
                },
                child: const Text('Spanish'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() => _selectedLanguage = 'French');
                  Navigator.pop(context);
                },
                child: const Text('French'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.blue),
                  title: const Text('Language'),
                  subtitle: Text(_selectedLanguage),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: _showLanguageDialog,
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.brightness_6, color: Colors.orange),
                  title: const Text('Theme'),
                  subtitle: Text(_isDarkTheme ? 'Dark' : 'Light'),
                  trailing: Switch(
                    value: _isDarkTheme,
                    onChanged: (val) {
                      setState(() => _isDarkTheme = val);
                      // You can add your theme change logic here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
