import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  CustomTextField(
      {@required this.hintText,
        @required this.controller,
        @required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Color(0xFFEBEBEB),
        ),
        cursorHeight: 20,
        cursorColor: Colors.red,
      ),
    );
  }
}