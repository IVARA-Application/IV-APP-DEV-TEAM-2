import 'package:flutter/material.dart';

class PreviousAttendance extends StatefulWidget {
  static String id = 'PreviousAttendance';
  @override
  _PreviousAttendanceState createState() => _PreviousAttendanceState();
}

class _PreviousAttendanceState extends State<PreviousAttendance> {
  Color blue = Color(0xFF076FA0);
  List<Map> attendanceList = [
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
    {'name': 'Hemanth', 'absent': true},
    {'name': 'Khushwant', 'absent': false},
    {'name': 'Tarun', 'absent': false},
  ];
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
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16'
  ];
  int currentday = 0;

  Widget makeDropDown(List<String> dropdownList, screenWidth, screenHeight) {
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
            onChanged: (_) {},
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
              child: IconButton(
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
                    color: Colors.white54,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(screenHeight * 0.022)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            makeDropDown(days, screenWidth, screenHeight),
                            makeDropDown(date, screenWidth, screenHeight),
                            makeDropDown(months, screenWidth, screenHeight),
                            makeDropDown(years, screenWidth, screenHeight),
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
                                color: Colors.white),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.05),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
