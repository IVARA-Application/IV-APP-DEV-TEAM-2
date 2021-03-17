import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/academic/academic_section.dart';
import 'package:new_ivara_app/student_screens/student_homepage/attendance/attendance_record.dart';
import 'package:new_ivara_app/student_screens/student_homepage/chat/chat_page.dart';
import 'package:new_ivara_app/student_screens/student_homepage/home.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/navbar.dart';

import 'notification/notification.dart';

class StudentHomePage extends StatefulWidget {
  int index;
  StudentHomePage(this.index);
  @override
  _StudentHomePageState createState() => _StudentHomePageState(index);
}

class _StudentHomePageState extends State<StudentHomePage> {
  static String id = 'StudentHomePage';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex;
  _StudentHomePageState(this.currentIndex);
  List tabs = [
    StudentHome(),
    StudentNotification(),
    StudentAttendance(),
    StudentChatPage(),
    StudentAcademicSection()
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Stack(
        children: [
          Container(
              decoration: kBGdecoration,
              height: double.infinity,
              width: double.infinity,
              child: tabs[currentIndex]),
          StudentNavbar(_scaffoldKey),
          Positioned(
            top: height * 0.88,
            left: width * 0.024,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(height * 0.1)),
                  border:
                      Border.all(color: Colors.white, width: height * 0.0015),
                  color: Color(0xFF697AE4),
                ),
                width: width * 0.96,
                height: height * 0.085,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  currentIndex == 0 ? height * 0.006 : 0),
                              child: Center(
                                child: Image.asset('assets/home.png',
                                    height: currentIndex == 0
                                        ? height * 0.02
                                        : height * 0.03,
                                    color: currentIndex == 0
                                        ? Color(0xFF08F7F8)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text('Home',
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: currentIndex == 1
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  currentIndex == 1 ? height * 0.006 : 0),
                              child: Center(
                                child: Image.asset('assets/notification.png',
                                    height: currentIndex == 1
                                        ? height * 0.02
                                        : height * 0.03,
                                    color: currentIndex == 1
                                        ? Color(0xFF08F7F8)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text('Notification',
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: currentIndex == 2
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  currentIndex == 2 ? height * 0.006 : 0),
                              child: Center(
                                child: Image.asset('assets/calendar.png',
                                    height: currentIndex == 2
                                        ? height * 0.02
                                        : height * 0.03,
                                    color: currentIndex == 2
                                        ? Color(0xFF08F7F8)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text('Calendar',
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 3;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: currentIndex == 3
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  currentIndex == 3 ? height * 0.006 : 0),
                              child: Center(
                                child: Image.asset('assets/chat.png',
                                    height: currentIndex == 3
                                        ? height * 0.02
                                        : height * 0.03,
                                    color: currentIndex == 3
                                        ? Color(0xFF08F7F8)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text('Chat',
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white))
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 4;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: currentIndex == 4
                                    ? Colors.white
                                    : Colors.transparent),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  currentIndex == 4 ? height * 0.006 : 0),
                              child: Center(
                                child: Image.asset('assets/report.png',
                                    height: currentIndex == 4
                                        ? height * 0.02
                                        : height * 0.03,
                                    color: currentIndex == 4
                                        ? Color(0xFF08F7F8)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Spacer(),
                          Text('Report',
                              style: TextStyle(
                                  fontSize: height * 0.015,
                                  color: Colors.white))
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
