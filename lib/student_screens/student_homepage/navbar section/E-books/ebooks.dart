import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/E-books/eBooksAndTestSeries.dart';

import '../../../drawer.dart';
import '../navbar.dart';

class StudentEbooks extends StatefulWidget {
  @override
  _StudentEbooksState createState() => _StudentEbooksState();
}

class _StudentEbooksState extends State<StudentEbooks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List classes = [
    'Class 4th',
    'Class 5th',
    'Class 6th',
    'Class 7th',
    'Class 8th',
    'Class 9th'
  ];
  int currentIndex = -1;

  Widget makeTabs(height, width) {
    return ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentEbook(
                      classes[index],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: kCardShape,
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.015, horizontal: width * 0.05),
                primary: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      classes[index],
                      style: ftt(context).headline6.copyWith(color: kLightBlue),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.brightness_1_outlined,
                          color: kDarkBlue, size: height * 0.03),
                      currentIndex == index
                          ? Icon(Icons.circle,
                              color: kDarkBlue, size: height * 0.02)
                          : Center(),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Stack(
        children: [
          Container(
              decoration: kBGdecoration,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Text(
                    'E-Book and E-Test-Series',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: height * 0.03),
                  ),
                  Expanded(
                    child: makeTabs(height, width),
                  )
                ],
              )),
          StudentNavbar(_scaffoldKey),
        ],
      ),
    );
  }
}
