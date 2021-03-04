import 'package:flutter/material.dart';
import 'package:new_ivara_app/student_screens/student_homepage/studentHomepage.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudentHomePage()),
          );
        },
        child: Text(
          'LoginPage',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
