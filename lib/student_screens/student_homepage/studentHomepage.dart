import 'package:flutter/material.dart';
import 'package:new_ivara_app/lib.dart';
class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  
  static String id = 'StudentHomePage';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Center()),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              // onTap: () {
              //   setState(() {
              //     currentIndex = 3;
              //   });
              //   Navigator.of(context).pop();
              // },
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'About',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Log Out',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'v1.0.1',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
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
              // child: StudentHome()
              child:StudentChatPage()
            ),
            Positioned(
                height: height * 0.08,
                width: width,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset('assets/drawer.png')),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset('assets/back.png')),
                  ],
                )),
            Positioned(
              top: height * 0.85,
              left: width * 0.05,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(height * 0.1)),
                    color: Color(0xFF697AE4),
                  ),
                  width: width * 0.9,
                  height: height * 0.08,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              currentIndex=0;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(height)),
                                      color:currentIndex==0?Colors.white:Colors.transparent
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(currentIndex==0?height*0.007:0),
                                  child: Center(
                                    child: Image.asset('assets/home.png',
                                        height: currentIndex==0?height * 0.02:height*0.03,
                                        color: currentIndex==0?Color(0xFF08F7F8):Colors.white
                                        ),
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
                              currentIndex=1;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(height)),
                                      color:currentIndex==1?Colors.white:Colors.transparent
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(currentIndex==1?height*0.007:0),
                                  child: Center(
                                    child: Image.asset('assets/notification.png',
                                        height: currentIndex==1?height * 0.02:height*0.03,
                                        color: currentIndex==1?Color(0xFF08F7F8):Colors.white
                                        ),
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
                              currentIndex=2;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(height)),
                                      color:currentIndex==2?Colors.white:Colors.transparent
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(currentIndex==2?height*0.007:0),
                                  child: Center(
                                    child: Image.asset('assets/calendar.png',
                                        height: currentIndex==2?height * 0.02:height*0.03,
                                        color: currentIndex==2?Color(0xFF08F7F8):Colors.white
                                        ),
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
                              currentIndex=3;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(height)),
                                      color:currentIndex==3?Colors.white:Colors.transparent
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(currentIndex==3?height*0.007:0),
                                  child: Center(
                                    child: Image.asset('assets/chat.png',
                                        height: currentIndex==3?height * 0.02:height*0.03,
                                        color: currentIndex==3?Color(0xFF08F7F8):Colors.white
                                        ),
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
                              currentIndex=4;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(height)),
                                      color:currentIndex==4?Colors.white:Colors.transparent
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(currentIndex==4?height*0.007:0),
                                  child: Center(
                                    child: Image.asset('assets/report.png',
                                        height: currentIndex==4?height * 0.02:height*0.03,
                                        color: currentIndex==4?Color(0xFF08F7F8):Colors.white
                                        ),
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
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
