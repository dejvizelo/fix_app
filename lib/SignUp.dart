import 'package:flutter/material.dart';
import 'package:fix_app/custom_widgets/CustomTextField.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _emailController = new TextEditingController();

  bool _isVisible = false;

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
                    'Regjistrohu',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Vendosni adresen tuaj email per t\'u regjistruar ne aplikacion.',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    obscureText: _isVisible,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onPressed: () {
                      print("Button pressed");
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    }
                  ),
                  FlatButton(
                      onPressed: () {
                        print(_emailController.text);
                      },
                      child: Text("Button")
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
