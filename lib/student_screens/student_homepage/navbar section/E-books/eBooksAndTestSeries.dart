import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';

import '../../../drawer.dart';
import '../navbar.dart';

class StudentEbook extends StatefulWidget {
  @override
  _StudentEbookState createState() => _StudentEbookState();
}

class _StudentEbookState extends State<StudentEbook> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List subjects = [
    'Physics',
    'Chemistry',
    'Maths',
    'English',
    'Hindi',
    'Computers'
  ];
  int currentIndex = 0;
  List<String> tabs = ['E-Books', 'E-Test-Series'];
  Widget makeBookTabs(height, width) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: kCardShape,
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.005, horizontal: width * 0.05),
                primary: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subjects[index],
                        style:
                            ftt(context).headline6.copyWith(color: kLightBlue),
                      ),
                      Text('E-Books',
                          style: TextStyle(color: Color(0xFF696969))),
                    ],
                  ),
                  Tab(
                      icon: Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          child: Image.asset(
                            "assets/file_download.png",
                            fit: BoxFit.cover,
                          ))),
                ],
              ),
            ),
          );
        });
  }

  Widget makeTestSeriesTabs(height, width) {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentIndex = index;
                });
              },
              style: ElevatedButton.styleFrom(
                shape: kCardShape,
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.005, horizontal: width * 0.05),
                primary: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subjects[index],
                        style:
                            ftt(context).headline6.copyWith(color: kLightBlue),
                      ),
                      Text('E-Test Series',
                          style: TextStyle(color: Color(0xFF696969))),
                    ],
                  ),
                  Tab(
                      icon: Container(
                          height: height * 0.04,
                          width: height * 0.04,
                          child: Image.asset(
                            "assets/file_download.png",
                            fit: BoxFit.cover,
                          ))),
                ],
              ),
            ),
          );
        });
  }

  Widget makeDropDown({List<String> list}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        elevation: 0,
        hint: Text(list[0], style: TextStyle(color: Colors.white)),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          print(value);
          if (value == 'E-Books') {
            setState(() {
              currentIndex = 0;
            });
          } else if (value == 'E-Test-Series') {
            setState(() {
              currentIndex = 1;
            });
          }
        },
      ),
    );
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.1),
                    Text(
                      'E-Book and E-Test-Series',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.03),
                    ),
                    SizedBox(height: height * 0.01),
                    makeDropDown(list: tabs),
                    Expanded(
                      child: currentIndex == 0
                          ? makeBookTabs(height, width)
                          : makeTestSeriesTabs(height, width),
                    )
                  ],
                ),
              )),
          StudentNavbar(_scaffoldKey),
        ],
      ),
    );
  }
}
