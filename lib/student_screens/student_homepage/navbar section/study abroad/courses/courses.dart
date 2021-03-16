import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/courses/courses_topic.dart';

import '../../../../drawer.dart';
import '../../navbar.dart';

class CoursesPage extends StatefulWidget {
  static String id = 'CoursesPage';
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List coursesList = [
    {'subjectName': 'Biology', 'image': 'assets/images/thumbnail.jpg'},
    {'subjectName': 'Mathematics', 'image': 'assets/images/thumbnail.jpg'},
    {'subjectName': 'Physics', 'image': 'assets/images/thumbnail.jpg'},
    {'subjectName': 'Chemistry', 'image': 'assets/images/thumbnail.jpg'},
    {'subjectName': 'History', 'image': 'assets/images/thumbnail.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    int index = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Stack(
        children: [
          Container(
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
          ),
          SafeArea(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.09),
                  child: Text(
                    "Courses",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: coursesList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CoursesTopicPage(coursesList,index)))
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenWidth * 0.09,
                                left: screenWidth * 0.07),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: screenHeight * 0.12,
                                      width: screenWidth * 0.38,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                coursesList[index]['image']),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black45,
                                                BlendMode.darken)),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: screenHeight * 0.12,
                                      width: screenWidth * 0.48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                      ),
                                    ),
                                    Positioned(
                                      child: Text(
                                        coursesList[index]['subjectName'],
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: screenWidth * 0.06),
                                      ),
                                      top: screenHeight * 0.025,
                                      left: screenWidth * 0.04,
                                    ),
                                    Positioned(
                                      child: Text(
                                        "Choose class",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 12),
                                      ),
                                      top: screenHeight * 0.07,
                                      left: screenWidth * 0.04,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
          StudentNavbar(_scaffoldKey),
        ],
      ),
    );
  }
}
