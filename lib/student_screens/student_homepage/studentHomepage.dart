import 'package:flutter/material.dart';
import 'package:new_ivara_app/lib.dart';

class StudentHomePage extends StatelessWidget {
  static String id = 'StudentHomePage';
  const StudentHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kBGdecoration,
          height: double.infinity,
          width: double.infinity,
          child: Column(children: [
            SizedBox(height: height * 0.1),
            Text('Hello,',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.04)),
            Text('Ankit Sharma',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: height * 0.04))
          ]),
        ),
      ),
    );
  }
}
