import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/study%20abroad/blogs/blogs.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/study%20abroad/courses/courses.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/study%20abroad/scholarships/scholarships.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/courses/courses.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/scholarships/scholarships.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/blogs/blogs.dart';

class StudyAbroadPage extends StatelessWidget {
  static String id = 'StudyAbroadPage';
  const StudyAbroadPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                            "Study Abroad Program",
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
                                              'assets/images/book1.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CoursesPage()))
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
                                            "Courses",
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
                                              'assets/images/Group126.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScholarshipsPage()))
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
                                            "Scholarship",
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
                                              'assets/images/news1.png'),
                                        ),
                                      ))),
                              GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BlogsPage()))
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
                                            "News & Blogs",
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
          ],
        ),
      ),
    );
  }
}
