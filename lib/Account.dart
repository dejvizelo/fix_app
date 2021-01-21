import 'package:flutter/material.dart';
import './services/auth.dart';
import './custom_widgets/MainButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Auth.auth.currentUser.email),
            Container(height: 20),
            MainButton(
              text: 'Reset password',
              onPressed: () async {
                await Auth.auth.sendPasswordResetEmail(email: Auth.auth.currentUser.email);
                _showToast();
                // Fluttertoast.showToast(
                //     msg: "An email was sent to reset your password",
                //     toastLength: Toast.LENGTH_LONG,
                //     timeInSecForIosWeb: 1,
                //     backgroundColor: Colors.white,
                //     textColor: Colors.black,
                //     fontSize: 16.0
                // );
              },
            ),
            Container(height: 10),
            MainButton(
              text: 'Log Out',
              onPressed: () async {
                await Auth().logOut(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
