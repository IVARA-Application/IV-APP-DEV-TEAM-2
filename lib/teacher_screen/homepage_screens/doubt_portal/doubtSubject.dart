import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/teacher_screen/drawer.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/doubt_portal/subjectChat.dart';
import 'package:new_ivara_app/teacher_screen/navbar.dart';

List subjects = [
  {'subjectName': 'Physics', 'icon': 'assets/subject.png'},
  {'subjectName': 'Chemistry', 'icon': 'assets/subject.png'},
  {'subjectName': 'Biology', 'icon': 'assets/subject.png'},
  {'subjectName': 'Maths', 'icon': 'assets/subject.png'},
  {'subjectName': 'English', 'icon': 'assets/subject.png'},
  {'subjectName': 'Social Science', 'icon': 'assets/subject.png'},
  {'subjectName': 'Hindi', 'icon': 'assets/subject.png'},
];

class DoubtSubjectPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: TeacherDrawer(),
      key: _scaffoldKey,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //     stops: [
            //   0.1,
            //   0.4,
            //   0.6,
            //   0.9
            // ],
            colors: [
              Color(0xFF8569C5),
              Color(0xFFC579B5),
              Color(0xFFF48380),
              Color(0xFFF3D37B),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  TeacherNavbar(_scaffoldKey),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.035),
                        child: Text(
                          "My Classes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.7,
                        child: Container(
                          child: ListView.builder(
                              itemCount: subjects.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.008,
                                      horizontal: screenWidth * 0.1),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SubjectChatPageTeacher(
                                                    subjects[i]['subjectName'],
                                                  )));
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth * 0.05,
                                            vertical: screenHeight * 0.009),
                                        child: Row(
                                          children: [
                                            Text(subjects[i]['subjectName'],
                                                style: TextStyle(
                                                    fontSize:
                                                        screenHeight * 0.03)),
                                            Spacer(),
                                            Image.asset(subjects[i]['icon'])
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
