import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Function onIconTap;

  PasswordTextField(
      {@required this.hintText,
      @required this.controller,
      @required this.obscureText,
      @required this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Color(0xFFEBEBEB),
            suffixIcon: GestureDetector(
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onTap: onIconTap,
            )
        ),
        cursorHeight: 20,
        cursorColor: Colors.red,
      ),
    );
  }
}
