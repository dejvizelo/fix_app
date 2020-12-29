import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function onPressed;

  CustomTextField(
      {@required this.hintText,
        @required this.controller,
        @required this.obscureText,
        @required this.keyboardType,
        @required this.onPressed
      });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 45,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          suffixIcon: obscureText
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: onPressed,
          )
              : Container(),
        ),
        cursorHeight: 20,
        cursorColor: Colors.red,
      ),
    );
  }
}
