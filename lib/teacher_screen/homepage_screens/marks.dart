import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TeacherMarks extends StatefulWidget {
  @override
  _TeacherMarksState createState() => _TeacherMarksState();
}

class _TeacherMarksState extends State<TeacherMarks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> subjects = ['Maths', 'Physics', 'Hindi', 'English'];
  List<String> examType = ['Exam Type', 'Sessionals', 'Half-Yearly', 'Finals'];

  List marks = [
    {
      'name': 'Hemanth',
      'marks': [
        {'subjectName': 'Physics', 'marks': '18'},
        {'subjectName': 'Chemistry', 'marks': '20'},
        {'subjectName': 'Biology', 'marks': '15'}
      ]
    },
    {
      'name': 'Khushwant',
      'marks': [
        {'subjectName': 'Physics', 'marks': '18'},
        {'subjectName': 'Chemistry', 'marks': '20'},
        {'subjectName': 'Biology', 'marks': '15'}
      ]
    },
    {
      'name': 'Tarun',
      'marks': [
        {'subjectName': 'Physics', 'marks': '18'},
        {'subjectName': 'Chemistry', 'marks': '20'},
        {'subjectName': 'Biology', 'marks': '15'}
      ]
    },
    {
      'name': 'Hemanth',
      'marks': [
        {'subjectName': 'Physics', 'marks': '18'},
        {'subjectName': 'Chemistry', 'marks': '20'},
        {'subjectName': 'Biology', 'marks': '15'}
      ]
    }
  ];
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

  Widget makeStudentList(height, width) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: marks.length,
          itemBuilder: (context, index) {
            CarouselController buttonCarouselController = CarouselController();
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(left: width * 0.03),
                    width: width * 0.35,
                    child: Text(
                        (index + 1).toString() + '. ' + marks[index]['name'],
                        style: TextStyle(color: kPurple))),
                Container(
                    height: height * 0.045,
                    width: width * 0.003,
                    color: kPurple),
                Container(
                  width: width * 0.45,
                  child: Center(
                      child: SizedBox(
                    height: height * 0.03,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () => buttonCarouselController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear),
                            child: Icon(Icons.keyboard_arrow_left,
                                color: Colors.white)),
                        Expanded(
                          child: CarouselSlider(
                            carouselController: buttonCarouselController,
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                            ),
                            items: marks[index]['marks'].map<Widget>((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              i['subjectName'],
                                              style: TextStyle(
                                                color: kPurple,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: width * 0.08,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.white),
                                              child: Center(
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: height *
                                                                  0.015),
                                                      border: InputBorder.none,
                                                      hintText: i['marks']),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ));
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        GestureDetector(
                            onTap: () => buttonCarouselController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear),
                            child: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white)),
                      ],
                    ),
                  )),
                )
              ],
            );
          }),
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
          child: SingleChildScrollView(
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: width * 0.35,
                                  child: Center(
                                      child: Text('Student Name',
                                          style: TextStyle(
                                              color: kPurple,
                                              fontSize: height * 0.025)))),
                              Container(
                                  height: height * 0.035,
                                  width: width * 0.005,
                                  color: Colors.white),
                              Container(
                                  width: width * 0.45,
                                  child: Center(
                                      child: Text('List of Subjects',
                                          style: TextStyle(
                                              color: kPurple,
                                              fontSize: height * 0.025))))
                            ],
                          ),
                          Divider(color: Colors.white),
                          Expanded(
                            child: makeStudentList(height, width),
                          )
                        ],
                      )),
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
            ),
          )),
    );
  }
}
