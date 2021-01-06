import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/MainButton.dart';
import 'package:fix_app/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: MainButton(
            text: 'Log Out',
            onPressed: () async {
              await Auth().logOut(context);
            },
          ),
        )
    );
  }
}

