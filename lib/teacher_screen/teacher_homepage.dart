import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/schedule_call.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/chat_councellor.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/heal_my_mind_videos.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/attendance.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/chat.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/classroom.dart';

class TeacherHomepage extends StatelessWidget {
  static String id = 'TeacherHomepage';
  const TeacherHomepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/icons/tab.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/icons/back.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.035),
                          child: Text(
                            "Hello, \n Hemanth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/classroom.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ClassroomPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "My Classroom",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/entermarks.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherChatPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "Enter Marks",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/attendance(1).png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ParentAttendance()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "Attendance",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/virtual.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleACallPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "Virtual Tution",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/boubt.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherChatPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "Doubt Portal",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: screenWidth * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 1.0),
                                  child: CircleAvatar(
                                      radius: 60.0,
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ClipRRect(
                                          child: Image.asset(
                                              'assets/images/announcement.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleACallPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100.0),
                                            )),
                                        child: new Center(
                                          child: new Text(
                                            "Post An Announcement",
                                            style: TextStyle(
                                                color: Color(0xFF8569C5),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
