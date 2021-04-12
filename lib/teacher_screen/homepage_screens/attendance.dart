import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/teacher_screen/drawer.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/Methods/uploadAttendanceMethods.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/previousAttendance.dart';
import 'package:new_ivara_app/teacher_screen/navbar.dart';

class TeacherAttendance extends StatefulWidget {
  int clasS = 7;
  static String id = 'ParentAttendance';
  @override
  _TeacherAttendanceState createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color blue = Color(0xFF076FA0);
  bool isLoading = false;
  List<Map<String, dynamic>> attendanceList;

  Widget getAttendanceList(screenHeight, screenWidth) {
    return ListView.builder(
      itemCount: attendanceList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Row(children: [
            Text(attendanceList[index]['name'],
                style: TextStyle(
                  color: Color(0xFF697AE4),
                  fontSize: screenHeight * 0.028,
                )),
            Spacer(),
            SizedBox(
              height: screenHeight * 0.08,
              width: screenWidth * 0.1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (attendanceList[index]['absent']) {
                      attendanceList[index]['absent'] = false;
                      UploadAttendanceMethods.changeAttendance(
                          attendanceList[index]['id'], false);
                    } else {
                      attendanceList[index]['absent'] = true;
                      UploadAttendanceMethods.changeAttendance(
                          attendanceList[index]['id'], true);
                    }
                  });
                },
                icon: Stack(
                  children: [
                    Icon(
                        attendanceList[index]['absent']
                            ? Icons.brightness_1
                            : Icons.radio_button_unchecked,
                        color: attendanceList[index]['absent']
                            ? Colors.red
                            : Colors.black),
                    Icon(Icons.radio_button_unchecked),
                  ],
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.05)
          ]),
        );
      },
    );
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
    attendanceList = await UploadAttendanceMethods.getAttendance(widget.clasS);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: TeacherDrawer(),
      key:_scaffoldKey,
      body: Container(
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
      
      child:SafeArea(
        child: Center(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TeacherNavbar(_scaffoldKey),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.04,),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Attendance List',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PreviousAttendance(widget.clasS)));
                              },
                              icon: Icon(
                                Icons.event,
                                color: Colors.white,
                              ),
                              iconSize: screenHeight * 0.05,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Hero(
                    //transitionOnUserGestures: true,
                    tag: "Container",
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight * 0.05),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.04),
                                ),
                                color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.05),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.08),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Student List',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF697AE4),
                                              decoration: TextDecoration
                                                  .underline)),
                                      VerticalDivider(
                                        color: Colors.red,
                                        width: 20,
                                      ),
                                      Text('Absent',
                                          style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF697AE4),
                                              decoration: TextDecoration
                                                  .underline)),
                                    ],
                                  ),
                                ),
                                isLoading
                                    ? CircularProgressIndicator()
                                    : Expanded(
                                        child: getAttendanceList(
                                            screenHeight, screenWidth),
                                      ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Center(
                        child: Container(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular((8)),
                                color: Colors.white),
                            child: Center(
                                child: Text('Submit',
                                    style: TextStyle(
                                        color: kDarkBlue,
                                        fontSize: screenHeight * 0.025,
                                        fontWeight: FontWeight.w500)))),
                      ),
              SizedBox(height:screenHeight*0.03)
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
