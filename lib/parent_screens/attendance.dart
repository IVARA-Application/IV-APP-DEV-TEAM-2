import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/Methods/attendanceMethods.dart';
import 'package:new_ivara_app/parent_screens/drawer.dart';
import 'package:new_ivara_app/parent_screens/navbar.dart';

class ParentAttendance extends StatefulWidget {
  @override
  _ParentAttendanceState createState() => _ParentAttendanceState();
}

class _ParentAttendanceState extends State<ParentAttendance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = DateTime.now().day - 1;
  Map data = {};
  Map attendance = {};
  bool isLoading = false;
  bool isStudentExists = false;
  String currentMonth = DateFormat.MMM().format(DateTime.now());
  String currentYear = DateTime.now().year.toString();
  Map timeTable;
  ScrollController scrollController = ScrollController();
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
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
  ];
  bool present;
  Map monthToNumber = {
    'Jan': "01",
    'Feb': "02",
    'Mar': "03",
    'Apr': "04",
    'May': "05",
    'Jun': "06",
    'Jul': "07",
    'Aug': "08",
    'Sep': "09",
    'Oct': "10",
    'Nov': "11",
    'Dec': "12"
  };
  Widget makeDropDown({List<String> list, onchanged, String type}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        elevation: 0,
        value: type == "month" ? currentMonth : currentYear,
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
        controller: scrollController,
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
                          DateFormat.E().format(DateTime.utc(
                              int.parse(currentYear),
                              int.parse(monthToNumber[currentMonth]),
                              index + 1)), //(index + 1).toString(),
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
                          setAttendance();
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
                              DateFormat.E().format(DateTime.utc(
                                  int.parse(currentYear),
                                  int.parse(monthToNumber[currentMonth]),
                                  index + 1)), //(index + 1).toString(),
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
  void initState() {
    // TODO: implement initState
    super.initState();

    getAttendance();
  }

  void getAttendance() async {
    setState(() {
      isLoading = true;
    });
    String studentId = await AttendanceMethods.checkForStudent(
        Get.find<AuthController>().user.value.uid);
    if (studentId != null && studentId.trim() != '') {
      attendance = await AttendanceMethods.getAttendanceOfStudent(studentId);
      timeTable = await AttendanceMethods.getTimeTable();
      setAttendance();
      print(attendance);
      setState(() {
        isLoading = false;
        isStudentExists = true;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        scrollController.animateTo(
          currentIndex * 20.0,
          duration: Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
        );
      });

      return;
    }
    setState(() {
      isLoading = false;
      isStudentExists = false;
    });
  }

  void setAttendance() {
    String date =
        "${(currentIndex + 1).toString().padLeft(2, "0")}-${monthToNumber[currentMonth]}-$currentYear";
   // setTimeTable();
    if (attendance.containsKey(date)) {
      setState(() {
        present = attendance[date];
      });
    } else {
      setState(() {
        present = null;
      });
    }
    setTimeTable();
  }

  void setTimeTable() {
    String day = DateFormat.E().format(DateTime.utc(int.parse(currentYear),
        int.parse(monthToNumber[currentMonth]), currentIndex + 1));
    print("DAY:"+day);
    setState(() {
      classes = timeTable[day];
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //  AttendanceMethods.setTimeTable();
      // }),
      drawer: ParentDrawer(),
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        decoration: kBGdecoration,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : !isStudentExists
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                        child: Text(
                            "No Student is connected to your profile yet!!")),
                  )
                : Column(
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
                        borderRadius:
                            BorderRadius.all(Radius.circular(height * 0.015)),
                        color: Colors.transparent,
                        child: Container(
                          height: height * 0.14,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(height * 0.015)),
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
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              child: Row(
                                children: [
                                  makeDropDown(
                                      list: months,
                                      onchanged: (month) {
                                        setState(() {
                                          currentMonth = month;
                                        });
                                        setAttendance();
                                      },
                                      type: "month"),
                                  Spacer(),
                                  makeDropDown(
                                      list: years,
                                      onchanged: (year) {
                                        setState(() {
                                          currentYear = year;
                                        });
                                        setAttendance();
                                      },
                                      type: "year"),
                                ],
                              ),
                            ),
                            Expanded(
                              child: makeDateList(height, width),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.005,
                              horizontal: width * 0.22),
                          child: present == null
                              ? Text("No Record",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                      fontSize: height * 0.025))
                              : Text(!present ? 'PRESENT' : 'ABSENT',
                                  style: TextStyle(
                                      color: !present
                                          ? Color(0xFF6EFE96)
                                          : Colors.red,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                      fontSize: height * 0.025)),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Material(
                        elevation: 5,
                        borderRadius:
                            BorderRadius.all(Radius.circular(height * 0.015)),
                        color: Colors.transparent,
                        child: Container(
                          height: height * 0.52,
                          width: width * 0.82,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(height * 0.015)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width * 0.25,
                                        child: Column(children: [
                                          Card(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: height * 0.005,
                                                  horizontal: width * 0.02),
                                              child: Text(
                                                  classes[index]['time'],
                                                  style: TextStyle(
                                                      color: kDarkBlue)),
                                            ),
                                          ),
                                          SizedBox(height: height * 0.04),
                                          Card(
                                            color: kLightBlue,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: height * 0.005,
                                                  horizontal: width * 0.02),
                                              child: Text(
                                                  classes[index]['duration'],
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ]),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: height * 0.005),
                                            child: Icon(
                                                Icons.fiber_manual_record,
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
                                                  child: Icon(
                                                      Icons.fiber_manual_record,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(classes[index]['subjectName'],
                                                style: TextStyle(
                                                    fontSize: height * 0.028)),
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
