import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  static String id = 'StudentHomePage';
  const StudentHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color(0xFF8569C5),
                Color(0xFFC579B5),
                Color(0xFFF48380),
                Color(0xFFF3d37B),
              ],
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Column(children:[
            SizedBox(height:height*0.1),
            Text('Hello,',style:TextStyle(color:Colors.white,fontWeight: FontWeight.w700,fontSize: height*0.04)),
            Text('Ankit Sharma',style:TextStyle(color:Colors.white,fontWeight: FontWeight.w700,fontSize: height*0.04))
          ]),
        ),
      ),
    );
  }
}
