import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  Function(String) onchange;
  TextInputType inputType;
  CustomTextField(
      {super.key,
      required this.inputType,
      required this.hint,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        keyboardType: inputType,
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6), // مدور سنة
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
      ),
    );
  }
}
