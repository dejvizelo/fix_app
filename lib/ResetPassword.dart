import 'package:fix_app/custom_widgets/MainButton.dart';
import 'package:fix_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'custom_widgets/CustomTextField.dart';

class ResetPassword extends StatefulWidget {

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailController = new TextEditingController();

  bool validateEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
    return emailValid;
  }

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black12.withOpacity(0.05),
      ),
      child: Text("An email was sent to reset your password", style: TextStyle(color: Colors.black87)),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 5),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: MediaQuery.of(context).size.height - 150,
            left: MediaQuery.of(context).size.width / 2 - 135,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Text("Fjalekalimi i ri", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
              ),
              Container(height: 30),
              CustomTextField(
                hintText: 'Vendos emailin',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              Container(height: 20),
              MainButton(
                text: "Rivendos",
                onPressed: () async {
                  if (validateEmail(_emailController.text)) {
                    print("Email valid");
                    await Auth.auth.sendPasswordResetEmail(email: _emailController.text);
                    _showToast();
                  } else {
                    print("Email not valid");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
