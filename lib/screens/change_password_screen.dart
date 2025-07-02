// Change Password Screen
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isSaving = false;
  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      await Future.delayed(const Duration(milliseconds: 800)); // Simulate save
      setState(() => _isSaving = false);
      if (mounted) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Password changed successfully!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      Navigator.of(context).pop(); // Go back
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _currentPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showCurrent
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() => _showCurrent = !_showCurrent);
                          },
                        ),
                      ),
                      obscureText: !_showCurrent,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showNew ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() => _showNew = !_showNew);
                          },
                        ),
                      ),
                      obscureText: !_showNew,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm New Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showConfirm
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() => _showConfirm = !_showConfirm);
                          },
                        ),
                      ),
                      obscureText: !_showConfirm,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your new password';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _changePassword,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child:
                            _isSaving
                                ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                                : const Text(
                                  'Change Password',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
