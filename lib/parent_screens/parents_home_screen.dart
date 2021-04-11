import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/navbar.dart';
import 'package:new_ivara_app/parent_screens/parent_academic_section.dart';
import 'package:new_ivara_app/parent_screens/teachers_list.dart';
import 'package:new_ivara_app/shared/glow_circle_avatar.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/attendance.dart';

import 'attendance.dart';
import 'drawer.dart';

class ParentsHomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: ParentDrawer(),
      key:_scaffoldKey,
      body: Container(
        decoration: kPBGdecoration,
        child: Column(
          children: [
            SizedBox(height: height*0.03,),
            ParentNavbar(_scaffoldKey),
            SizedBox(height:height*0.02),
            Text('Hello,',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height*0.06)),
            Text('Ajay Sharma',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: height*0.04)),
            SizedBox(height:height*0.03),
            CustomCard(
              imgPath: 'assets/images/teacherlist.png',
              title: 'Teacher List',
              onTap: () {
                Get.to(TeachersList());
              },
            ),
            CustomCard(
              imgPath: 'assets/images/acadmis.png',
              title: 'Academics',
              onTap: () {
                Get.to(ParentAcademicSection());
              },
            ),
            CustomCard(
              imgPath: 'assets/images/attendance(1).png',
              title: 'Attendance',
              onTap: () {
                Get.to(ParentAttendance());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final VoidCallback onTap;
  const CustomCard({
    Key key,
    @required this.imgPath,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          // padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imgPath),
              Spacer(flex: 2),
              Text(
                title,
                style: ftt(context).headline5.copyWith(
                      color: kLightBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
