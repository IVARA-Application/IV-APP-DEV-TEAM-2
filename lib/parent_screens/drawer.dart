import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/parent_screens/parents_home_screen.dart';
import 'package:new_ivara_app/parent_screens/parents_upcoming_test.dart';
import 'package:new_ivara_app/parent_screens/teachers_list.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/study_abroad.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/24X7DoubtPortal/24X7_doubt.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/E-books/ebooks.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/entrance%20exam/entrance_exam.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/heal%20my%20mind/heal_my_mind.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/skill_development.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/student_details.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/virtual_tution_class.dart';
import 'package:new_ivara_app/teacher_screen/teacher_homepage.dart';

import 'attendance.dart';


class ParentDrawer extends StatefulWidget {
  @override
  _ParentDrawerState createState() => _ParentDrawerState();
}

class _ParentDrawerState extends State<ParentDrawer> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: height * 0.265,
            child: DrawerHeader(
              child: Padding(
                padding: EdgeInsets.only(left: height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: height * 0.01),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(height),
                          child: Image.asset(
                            'assets/profile.png',
                            height: height * 0.1,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: height * 0.003,
                    ),
                    Text('Ankit Sharma',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.w600)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Class 10th",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFA93BDF),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParentsHomeScreen()));
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: height * 0.03,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: kDarkBlue),
                    textAlign: TextAlign.center,
                  ),
                  currentIndex == 0
                      ? Container(
                          height: height * 0.003,
                          width: width * 0.15,
                          color: kDarkBlue)
                      : Center()
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
              Navigator.push(context,MaterialPageRoute(builder: (context) => ParentAttendance()));
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: height * 0.03,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attendance',
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: kDarkBlue),
                    textAlign: TextAlign.center,
                  ),
                  currentIndex == 1
                      ? Container(
                          height: height * 0.003,
                          width: width * 0.15,
                          color: kDarkBlue)
                      : Center()
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
              Navigator.push(context,MaterialPageRoute(builder: (context) => TeachersList()));
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: height * 0.03,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teachers List',
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: kDarkBlue),
                    textAlign: TextAlign.center,
                  ),
                  currentIndex == 2
                      ? Container(
                          height: height * 0.003,
                          width: width * 0.15,
                          color: kDarkBlue)
                      : Center()
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
              Navigator.push(context,MaterialPageRoute(builder: (context) => ParentsUpcomingTests()));
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: height * 0.03,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Tests',
                    style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500,
                        color: kDarkBlue),
                    textAlign: TextAlign.center,
                  ),
                  currentIndex == 2
                      ? Container(
                          height: height * 0.003,
                          width: width * 0.15,
                          color: kDarkBlue)
                      : Center()
                ],
              ),
            ),
          ),
          
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.03),
              child: Text(
                'Contact Us',
                style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w500,
                    color: kDarkBlue),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.find<AuthController>().signOut();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: height * 0.03, vertical: height * 0.00),
              child: Text(
                'Logout',
                style: TextStyle(
                    fontSize: height * 0.025,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: height * 0.02)
        ],
      ),
    );
  }
}
