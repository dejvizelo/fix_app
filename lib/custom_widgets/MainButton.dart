import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  MainButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(text),
      onPressed: onPressed,
      textColor: Colors.black,
      color: Color(0xFFFFCC00),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      minWidth: double.infinity,
    );
  }
}
