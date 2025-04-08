import 'package:flutter/material.dart';

class CustomEmailInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomEmailInput({
    super.key,
    required this.controller,
    this.hintText = 'example@gmail.com',
  });

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: _validateEmail,
      decoration: InputDecoration(
        label: const Text('Enter Email Address'),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
