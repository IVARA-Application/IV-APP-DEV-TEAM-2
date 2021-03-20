import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';

class TeacherMarks extends StatefulWidget {
  @override
  _TeacherMarksState createState() => _TeacherMarksState();
}

class _TeacherMarksState extends State<TeacherMarks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> subjects = ['Maths', 'Physics', 'Hindi', 'English'];
  List<String> examType = ['Exam Type', 'Sessionals', 'Half-Yearly', 'Finals'];
  Widget makeDropDown({List<String> list, onchanged}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            elevation: 0,
            hint: Text(list[0]),
            icon: Icon(Icons.keyboard_arrow_down),
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onchanged,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      //drawer: StudentDrawer(),
      body: Container(
          decoration: kBGdecoration,
          height: double.infinity,
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/tab.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/back.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Text('Marks',
                    style: TextStyle(
                        fontSize: height * 0.03, color: Colors.white)),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    makeDropDown(list: subjects, onchanged: (_) {}),
                    makeDropDown(list: examType, onchanged: (_) {})
                  ],
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.5)),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Container(
                      width: width * 0.25,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((8)),
                          color: Colors.white),
                      child: Center(
                          child: Text('Submit',
                              style: TextStyle(
                                  color: kDarkBlue,
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w500)))),
                )
              ],
            ),
          )),
    );
  }
}
