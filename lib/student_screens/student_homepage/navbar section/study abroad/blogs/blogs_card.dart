import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/courses/courses.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/scholarships/scholarships.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/blogs/blogs.dart';

class BlogsCardPage extends StatelessWidget {
  static String id = 'BlogsCardPage';
  const BlogsCardPage({Key key}) : super(key: key);

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
                            "News & Blogs",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        Container(
                          height: screenHeight*0.23,
                          width: screenWidth*0.7,
                          decoration: BoxDecoration(
                            
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                          ),
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
                              Image.asset('assets/images/lab1(1).png',
                                fit: BoxFit.cover,
                                )
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight*0.3,
                          width: screenWidth*0.7,
                          decoration: BoxDecoration(
                          color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top:screenHeight*0.02,bottom: screenHeight*0.01),
                                child: Text(
                                  'Blog 1',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF697AE4),
                                    
                                  ),
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text('Consectetur proident commodo pariatur labore enim laborum. Do quis deserunt in aliquip. Adipisicing excepteur amet qui minim labore culpa. '),
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
          ],
        ),
      ),
    );
  }
}
