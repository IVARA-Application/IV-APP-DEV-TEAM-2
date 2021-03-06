import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  static String id = 'StudentHomePage';
  const StudentHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ElevatedButton(
        onPressed: () {
        },
        child: Text(
          'LoginPage',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
