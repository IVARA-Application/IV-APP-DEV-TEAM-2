import 'package:flutter/material.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/Methods/uploadAttendanceMethods.dart';

class PreviousAttendance extends StatefulWidget {
  int clasS;
  PreviousAttendance(this.clasS);
  static String id = 'PreviousAttendance';
  @override
  _PreviousAttendanceState createState() => _PreviousAttendanceState();
}

class _PreviousAttendanceState extends State<PreviousAttendance> {
  Color blue = Color(0xFF076FA0);
  String currentDate = '01';
  String currentMonth = 'Jan';
  String currentYear = "2021";
  String currentDay = "Mon";
  bool isLoading = false;
  List<Map> attendanceList = [];
  List<Map<String, dynamic>> studentList;
  var months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  var years = ['2020', '2021'];
  var days = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  var date = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16'
  ];
  int currentday = 0;

  Widget makeDropDown(
      List<String> dropdownList, screenWidth, screenHeight, String type) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        height: screenHeight * 0.046,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenHeight * 0.015),
          color: Colors.transparent,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            elevation: 10,
            value: type == "date"
                ? currentDate
                : type == "month"
                    ? currentMonth
                    : type == "year"
                        ? currentYear
                        : currentDay,
            hint: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Text(
                dropdownList[0],
                style: TextStyle(color: blue),
              ),
            ),
            iconEnabledColor: blue,
            icon: Icon(Icons.keyboard_arrow_down),
            items: dropdownList.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(
                  value,
                  style: TextStyle(color: blue),
                ),
              );
            }).toList(),
            onChanged: (value) async {
              onDropDownChanged(type, value);
            },
          ),
        ),
      ),
    );
  }

  Widget getAttendanceList(screenHeight, screenWidth) {
    return ListView.builder(
      itemCount: attendanceList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Row(children: [
            Text(attendanceList[index]['name'],
                style: TextStyle(
                    fontSize: screenHeight * 0.028, color: Color(0xFF697AE4))),
            Spacer(),
            SizedBox(
              height: screenHeight * 0.08,
              width: screenWidth * 0.1,
              child: attendanceList[index]['isRecordPresent']
                  ? IconButton(
                      onPressed: () {},
                      icon: Stack(
                        children: [
                          Icon(Icons.brightness_1,
                              color: attendanceList[index]['absent']
                                  ? Colors.red
                                  : Color(0XFF00e600)),
                          Icon(Icons.radio_button_unchecked),
                        ],
                      ),
                    )
                  : Text("-"),
            ),
            SizedBox(width: screenWidth * 0.05)
          ]),
        );
      },
    );
  }

  void onDropDownChanged(String type,String value) async{
    if (type == "days") {
      setState(() {
        currentDay = value;
      });
    } else if (type == 'date') {
      setState(() {
        currentDate = value;
      });
    } else if (type == "month") {
      setState(() {
        currentMonth = value;
      });
    } else if (type == "year") {
      setState(() {
        currentYear = value;
      });
    }
    setState(() {
      isLoading = true;
    });
    String month;
    switch (currentMonth) {
      case 'Jan':
        month = "01";
        break;
      case 'Feb':
        month = "02";
        break;
      case 'March':
        month = "03";
        break;
      case 'April':
        month = "04";
        break;
      case 'May':
        month = "05";
        break;
      case 'June':
        month = "06";
        break;
      case 'July':
        month = "07";
        break;
      case 'Aug':
        month = "08";
        break;
      case 'Sept':
        month = "09";
        break;
      case 'Oct':
        month = "10";
        break;
      case 'Nov':
        month = "11";
        break;
      case 'Dec':
        month = "12";
        break;
      default:
        month = "01";
    }
    await makeAttendanceList(currentDate, month, currentYear);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAttendace();
  }

  void getAttendace() async {
    setState(() {
      isLoading = true;
    });
    studentList =
        await UploadAttendanceMethods.getPreviousAttendance(widget.clasS);
    await makeAttendanceList('01', '01', '2021');
    setState(() {
      isLoading = false;
    });
  }

  Future makeAttendanceList(String date, String month, String year) async {
    attendanceList = [];
    await Future.forEach(studentList, (student) {
      Map attendance = student['attendance'];
      if (attendance.containsKey(date + '-' + month + '-' + year)) {
        attendanceList.add(
          {
            'id': student['uid'],
            'name': student['name'],
            'absent': attendance[date + '-' + month + '-' + year],
            'isRecordPresent': true,
          },
        );
      } else {
        attendanceList.add(
          {
            'id': student['uid'],
            'name': student['name'],
            'isRecordPresent': false,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.07),
                  child: Text('Attendance Record',
                      style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.008,
                      horizontal: screenWidth * 0.05),
                  child: Card(
                    color: Colors.white.withOpacity(0.7),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.022)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            makeDropDown(
                                days, screenWidth, screenHeight, "days"),
                            makeDropDown(
                                date, screenWidth, screenHeight, "date"),
                            makeDropDown(
                                months, screenWidth, screenHeight, "month"),
                            makeDropDown(
                                years, screenWidth, screenHeight, "year"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    //transitionOnUserGestures: true,
                    tag: "Container",
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenHeight * 0.04),
                                ),
                                color: Colors.white.withOpacity(0.7)),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.03),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.05),
                                  child: Row(
                                    children: [
                                      Text('Student name',
                                          style: TextStyle(
                                              fontSize: screenHeight * 0.028,
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xFF697AE4))),
                                      Spacer(),
                                      Text('Absent',
                                          style: TextStyle(
                                              fontSize: screenHeight * 0.028,
                                              fontWeight: FontWeight.w800,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xFF697AE4))),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
