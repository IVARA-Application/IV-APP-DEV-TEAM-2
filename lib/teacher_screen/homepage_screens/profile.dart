import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/schedule_call.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/chat_councellor.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/heal_my_mind_videos.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/attendance.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/chat.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/classroom.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/marks.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'ProfilePage';
  const ProfilePage({Key key}) : super(key: key);

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
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                            "My Profile",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: screenHeight * 0.5,
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenHeight*0.04),
                                child: CircleAvatar(
                                  radius: screenHeight*0.09,
                                  backgroundColor: Color(0xFFF3D37B),
                                  child: CircleAvatar(
                                    radius: screenHeight*0.085,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                      'assets/profile.png',
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(left:screenWidth*0.05),
                                    width:screenWidth*0.4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Mobile No.',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Email ID',
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal:8),
                                    width: 2,
                                    color: Color(0xFF697AE4),
                                    height: screenHeight * 0.18,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            Get.find<AuthController>().name,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            Get.find<AuthController>().phoneNumber,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            Get.find<AuthController>().user.value.email,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                                color: Color(0xFF697AE4)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
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
