import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  Function() onPressed;
  CustomButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity, // ياخد عرض الشاشة
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87, // أسود فاتح
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // مدور سنة
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
