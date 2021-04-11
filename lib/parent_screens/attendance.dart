import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/drawer.dart';
import 'package:new_ivara_app/parent_screens/navbar.dart';

class ParentAttendance extends StatefulWidget {
  @override
  _ParentAttendanceState createState() => _ParentAttendanceState();
}

class _ParentAttendanceState extends State<ParentAttendance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  Map data = {};
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<String> years = ['2020', '2021', '2022'];
  List weekDay = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday'
  ];
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List classes = [
    {
      'subjectName': 'Physics',
      'teacherName': 'Teacher Name',
      'id': 'IVID',
      'classNo': 'Class Number',
      'time': '09:00 AM',
      'duration': '01:30 hrs',
      'present': true
    },
    {
      'subjectName': 'Chemistry',
      'teacherName': 'Teacher Name',
      'id': 'IVID',
      'classNo': 'Class Number',
      'time': '10:40 AM',
      'duration': '01:30 hrs',
      'present': false
    },
    {
      'subjectName': 'Maths',
      'teacherName': 'Teacher Name',
      'id': 'IVID',
      'classNo': 'Class Number',
      'time': '10:40 AM',
      'duration': '01:30 hrs',
      'present': true
    },
    {
      'subjectName': 'Computer',
      'teacherName': 'Teacher Name',
      'id': 'IVID',
      'classNo': 'Class Number',
      'time': '10:40 AM',
      'duration': '01:30 hrs',
      'present': true
    }
  ];

  Widget makeDropDown({List<String> list, onchanged}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        elevation: 0,
        hint: Text(list[0], style: TextStyle(color: Color(0xFFF48380))),
        icon: Icon(Icons.keyboard_arrow_down),
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }

  Widget makeDateList(height, width) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 31,
        itemBuilder: (context, index) {
          return index == currentIndex
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.001,
                        bottom: height * 0.001,
                        left: index == 0 ? width * 0.05 : height * 0.001,
                        right: index == 30 ? width * 0.05 : height * 0.001),
                    child: Column(
                      children: [
                        Container(
                            height: height * 0.035,
                            width: height * 0.035,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(height),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text((index + 1).toString(),
                                  style: TextStyle(
                                      fontSize: height * 0.025,
                                      color: kDarkBlue)),
                            )),
                        SizedBox(height: height * 0.005),
                        Text(
                          days[index % 7], //(index + 1).toString(),
                          style: TextStyle(
                              fontSize: height * 0.015, color: Colors.white),
                        ),
                        Container(
                            height: height * 0.005,
                            width: width * 0.04,
                            color: Colors.white)
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.001,
                        bottom: height * 0.001,
                        left: index == 0 ? width * 0.05 : height * 0.001,
                        right: index == 30 ? width * 0.05 : height * 0.001),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        // child: Text(
                        //   days[index % 7], //(index + 1).toString(),
                        //   style: TextStyle(
                        //       fontSize: height * 0.025, color: kDarkBlue),
                        // ),
                        child: Column(
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontSize: height * 0.025, color: kDarkBlue),
                            ),
                            Text(
                              days[index % 7], //(index + 1).toString(),
                              style: TextStyle(
                                  fontSize: height * 0.015, color: kDarkBlue),
                            )
                          ],
                        )),
                  ),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: ParentDrawer(),
      key:_scaffoldKey,
      body: Container(
        width: double.infinity,
        decoration: kBGdecoration,
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            ParentNavbar(_scaffoldKey),
            Text('Attendance Record',
                style: TextStyle(
                    fontSize: height * 0.03,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: height * 0.01),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
              color: Colors.transparent,
              child: Container(
                height: height * 0.14,
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
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.01),
                    child: Row(
                      children: [
                        makeDropDown(list: months, onchanged: (_) {}),
                        Spacer(),
                        makeDropDown(list: years, onchanged: (_) {}),
                      ],
                    ),
                  ),
                  Expanded(
                    child: makeDateList(height, width),
                  )
                ]),
              ),
            ),
            SizedBox(height: height * 0.05),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
              color: Colors.transparent,
              child: Container(
                height: height * 0.6,
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
                      Color(0xFFD3C6E3).withOpacity(0.8),
                      Color(0xFFBAA3D4).withOpacity(0.9),
                      Color(0xFFA97BBA).withOpacity(0.9),
                    ],
                  ),
                ),
                child: ListView.builder(
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: height * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * 0.25,
                              child: Column(children: [
                                Card(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.005,
                                        horizontal: width * 0.02),
                                    child: Text(classes[index]['time'],
                                        style: TextStyle(color: kDarkBlue)),
                                  ),
                                ),
                                SizedBox(height: height * 0.04),
                                Card(
                                  color: kLightBlue,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.005,
                                        horizontal: width * 0.02),
                                    child: Text(classes[index]['duration'],
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                )
                              ]),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.005),
                                  child: Icon(Icons.fiber_manual_record,
                                      color: Colors.white),
                                ),
                                Container(
                                    height: height * 0.15,
                                    width: width * 0.005,
                                    color: Colors.white),
                                index == classes.length - 1
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.005),
                                        child: Icon(Icons.fiber_manual_record,
                                            color: Colors.white),
                                      )
                                    : Center()
                              ],
                            ),
                            Container(
                              height: height * 0.18,
                              width: width * 0.5,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(classes[index]['subjectName'],
                                          style: TextStyle(
                                              fontSize: height * 0.028)),
                                      Spacer(),
                                      Card(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.005,
                                              horizontal: width * 0.02),
                                          child: Text(
                                              classes[index]['present']
                                                  ? 'Present'
                                                  : 'Absent',
                                              style: TextStyle(
                                                  color: classes[index]
                                                          ['present']
                                                      ? Color(0xFF6EFE96)
                                                      : Colors.red,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(classes[index]['teacherName']),
                                  Text(classes[index]['id']),
                                  Text(classes[index]['classNo'])
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
