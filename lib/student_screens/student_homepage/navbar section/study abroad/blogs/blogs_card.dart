import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';

import '../../../../drawer.dart';
import '../../navbar.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/courses/courses.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/scholarships/scholarships.dart';

class BlogsCardPage extends StatefulWidget {
  List blogs;
  int index;
  BlogsCardPage(this.blogs, this.index);
  static String id = 'BlogsCardPage';

  @override
  _BlogsCardPageState createState() => _BlogsCardPageState(blogs, index);
}

class _BlogsCardPageState extends State<BlogsCardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List blogs;
  int index;
  _BlogsCardPageState(this.blogs, this.index);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8569C5),
              Color(0xFFC579B5),
              Color(0xFFF48380),
              Color(0xFFF3D37B),
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.035),
                    child: Text(
                      "News & Blogs",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.53,
                    width: screenWidth * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.23,
                          width: screenWidth * 0.7,
                          child: Carousel(
                            dotSize: 4,
                            dotSpacing: 15,
                            dotColor: Colors.white,
                            indicatorBgPadding: 5,
                            dotBgColor: Colors.transparent,
                            dotVerticalPadding: 5,
                            dotPosition: DotPosition.bottomCenter,
                            images: [
                              Image.asset(
                                'assets/images/thumbnail.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/lab1(1).png',
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.02,
                                  bottom: screenHeight * 0.01),
                              child: Text(
                                blogs[index]['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF697AE4),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(children: [
                            Padding(
                                padding: EdgeInsets.all(screenHeight * 0.015),
                                child: Text(blogs[index]['description'])),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: screenHeight * 0.45,
                left: screenWidth * 0.125,
                child: Container(
                    width: screenWidth * 0.75,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (index > 0) {
                                index -= 1;
                              } else {
                                index = blogs.length - 1;
                              }
                            });
                          },
                          child: Container(
                            height: screenWidth * 0.08,
                            width: screenWidth * 0.08,
                            decoration: BoxDecoration(
                                color: kDarkBlue,
                                borderRadius:
                                    BorderRadius.circular(screenHeight)),
                            child: Center(
                              child: Icon(Icons.keyboard_arrow_left,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (index < blogs.length - 1) {
                                index += 1;
                              } else {
                                index = 0;
                              }
                            });
                          },
                          child: Container(
                            height: screenWidth * 0.08,
                            width: screenWidth * 0.08,
                            decoration: BoxDecoration(
                                color: kDarkBlue,
                                borderRadius:
                                    BorderRadius.circular(screenHeight)),
                            child: Center(
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ))),
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }
}
