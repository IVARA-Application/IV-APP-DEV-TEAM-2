import 'package:flutter/material.dart';
import 'package:new_ivara_app/student_screens/auth/login.dart';
import 'package:new_ivara_app/student_screens/auth/signup.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'LoginPage',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Text(
              'SignUpPage',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )
    ));
  }
}
