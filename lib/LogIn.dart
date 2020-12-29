import 'package:fix_app/custom_widgets/YellowButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/PasswordTextField.dart';
import 'package:fix_app/custom_widgets/CustomTextField.dart';

class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
          height: MediaQuery.of(context).size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(
                  'assets/logo.png',
                  width: 200,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Identifikohu',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Vendosni adresen tuaj email per t\'u identifikuar ne aplikacion.',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(height: 10),
                  CustomTextField(
                    hintText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Container(height: 10),
                  PasswordTextField(
                      hintText: 'Password',
                      obscureText: _passwordVisible,
                      controller: _passwordController,
                      onIconTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }
                  ),
                  Container(height: 10),
                  Container(height: 20),
                  YellowButton(
                    text: 'Log In',
                  ),
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Don't have an account?"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('SIGN UP'),
                        color: Color(0xFFFFCC00),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
