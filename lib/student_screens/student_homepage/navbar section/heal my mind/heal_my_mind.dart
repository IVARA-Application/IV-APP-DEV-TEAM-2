import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/schedule_call.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/chat_councellor.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/heal_my_mind_videos.dart';

import '../../../drawer.dart';
import '../navbar.dart';

class HealMyMindPage extends StatefulWidget {
  static String id = 'HealMyMindPage';
  const HealMyMindPage({Key key}) : super(key: key);

  @override
  _HealMyMindPageState createState() => _HealMyMindPageState();
}

class _HealMyMindPageState extends State<HealMyMindPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.09),
                      child: Text(
                        "Heal My Mind",
                        style: TextStyle(fontSize: 25, color: Colors.white),
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
                                          'assets/images/schedule1.png'),
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
                                height: screenHeight * 0.085,
                                width: screenWidth * 0.6,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(100.0),
                                            bottomLeft:
                                                Radius.circular(100.0))),
                                    child: new Center(
                                      child: new Text(
                                        "Schedule A Call",
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                                              'assets/images/conversation1.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatToCounsellorPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.085,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100.0),
                                                bottomLeft:
                                                    Radius.circular(100.0))),
                                        child: new Center(
                                          child: new Text(
                                            "Chat To Counsellor",
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
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
                                              'assets/images/responsive2.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HealMyMindVideosPage()))
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: Container(
                                    height: screenHeight * 0.085,
                                    width: screenWidth * 0.6,
                                    color: Colors.transparent,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100.0),
                                                bottomLeft:
                                                    Radius.circular(100.0))),
                                        child: new Center(
                                          child: new Text(
                                            "Heal My Mind Videos",
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
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }
}
