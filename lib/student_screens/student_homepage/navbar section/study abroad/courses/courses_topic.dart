import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../drawer.dart';
import '../../navbar.dart';

class CoursesTopicPage extends StatefulWidget {
  List courses;
  int index;
  static String id = 'CoursesTopicPage';
  CoursesTopicPage(this.courses, this.index);

  @override
  _CoursesTopicPageState createState() =>
      _CoursesTopicPageState(courses, index);
}

class _CoursesTopicPageState extends State<CoursesTopicPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List courses;
  int index;
  _CoursesTopicPageState(this.courses, this.index);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: SingleChildScrollView(
        child: Stack(
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
                      padding: EdgeInsets.only(top: screenHeight * 0.09),
                      child: Text(
                        "Courses",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.01, bottom: screenHeight * 0.1),
                      child: Text(
                        courses[index]['subjectName'],
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.1),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "Topic 1",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/focus1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.1),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "Topic 2",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/focus1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.1),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "Topic 3",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/focus1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }
}
