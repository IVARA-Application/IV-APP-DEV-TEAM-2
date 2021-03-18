import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/student_screens/student_homepage/academic/upcoming_test.dart';

class StudentAcademicSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: height * 0.1),
          Text('Academic Section',
              style: TextStyle(
                  fontSize: height * 0.03,
                  color: Colors.white,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: height * 0.015),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
            color: Colors.transparent,
            child: Container(
                height: height * 0.18,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(height * 0.015)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.15, 0.45, 0.75, 1.0],
                    colors: [
                      Color(0xFFFEFDFE).withOpacity(0.8),
                      Color(0xFFD3C6E3).withOpacity(0.8),
                      Color(0xFFBAA3D4).withOpacity(0.9),
                      Color(0xFFA97BBA).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.05),
                      child: Row(
                        children: [
                          Text('Physics',
                              style: TextStyle(
                                  color: kDarkBlue, fontSize: height * 0.03)),
                          Spacer(),
                          Text('72/100',
                              style: TextStyle(
                                  color: kDarkBlue, fontSize: height * 0.025))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(height * 0.01),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                height * 0.01),
                                            color: Colors.white),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(height * 0.01),
                                          child: Column(
                                            children: [
                                              Text('Test 1',
                                                  style: TextStyle(
                                                    color: Color(0xFFF8B461),
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: height * 0.003),
                                                  width: width * 0.06,
                                                  height: 2,
                                                  color: kLightBlue
                                                      .withOpacity(0.5)),
                                              Row(
                                                children: [
                                                  Text('14/',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFF8B461),
                                                      )),
                                                  Text('20',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFFF2609)))
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                }),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: height * 0.05,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(height: height * 0.04),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
            color: Colors.transparent,
            child: Container(
                height: height * 0.1,
                width: width * 0.85,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(height * 0.015)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.15, 0.45, 0.75, 1.0],
                    colors: [
                      Color(0xFFFEFDFE).withOpacity(0.8),
                      Color(0xFFFAE3E6).withOpacity(0.8),
                      Color(0xFFF6C5CD).withOpacity(0.9),
                      Color(0xFFED919F).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Row(
                    children: [
                      Text('Subject Wise Analysis',
                          style: TextStyle(fontSize: height * 0.025)),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right,
                          size: height * 0.05, color: Colors.white)
                    ],
                  ),
                )),
          ),
          SizedBox(height: height * 0.03),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
            color: Colors.transparent,
            child: Container(
                height: height * 0.11,
                width: width * 0.85,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(height * 0.015)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.15, 0.45, 0.75, 1.0],
                    colors: [
                      Color(0xFFFEFDFE).withOpacity(0.8),
                      Color(0xFFFAE3E6).withOpacity(0.8),
                      Color(0xFFF6C5CD).withOpacity(0.9),
                      Color(0xFFED919F).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Row(
                    children: [
                      Text('Overall Analysis',
                          style: TextStyle(fontSize: height * 0.025)),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right,
                          size: height * 0.05, color: Colors.white)
                    ],
                  ),
                )),
          ),
          SizedBox(height: height * 0.03),
          GestureDetector(
            onTap: ()=>{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TestPage()))
            },
                      child: Material(
              elevation: 5,
              borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
              color: Colors.transparent,
              child: Container(
                  height: height * 0.11,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(height * 0.015)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomCenter,
                      stops: [0.15, 0.45, 0.75, 1.0],
                      colors: [
                        Color(0xFFFEFDFE).withOpacity(0.8),
                        Color(0xFFFAE3E6).withOpacity(0.8),
                        Color(0xFFF6C5CD).withOpacity(0.9),
                        Color(0xFFED919F).withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Row(
                      children: [
                        Text('Upcoming Test Schedule',
                            style: TextStyle(fontSize: height * 0.025)),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right,
                            size: height * 0.05, color: Colors.white)
                      ],
                    ),
                  )),
            ),
          ),
       
       
        ],
      ),
    );
  }
}
