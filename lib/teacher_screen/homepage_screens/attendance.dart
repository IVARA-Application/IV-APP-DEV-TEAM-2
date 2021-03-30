import 'package:flutter/material.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/previousAttendance.dart';

class TeacherAttendance extends StatefulWidget {
  static String id = 'ParentAttendance';
  @override
  _TeacherAttendanceState createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
  Color blue = Color(0xFF076FA0);
  List<Map> attendanceList = [
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
  ];

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
                    } else {
                      attendanceList[index]['absent'] = true;
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
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
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
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onTap: () {},
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
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenHeight * 0.04,
                              vertical: screenHeight * 0.02),
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
                                                PreviousAttendance()));
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
                                    Expanded(
                                      child: getAttendanceList(
                                          screenHeight, screenWidth),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    TextButton(onPressed: () => {}, child: Text('Submit'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
