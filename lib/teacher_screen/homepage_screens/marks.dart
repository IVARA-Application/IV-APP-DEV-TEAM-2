import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_ivara_app/teacher_screen/homepage_screens/Methods/marksMethods.dart';

class TeacherMarks extends StatefulWidget {
  int clasS = 7;
  String currentExamType;
  TeacherMarks(this.currentExamType);
  @override
  _TeacherMarksState createState() => _TeacherMarksState();
}

class _TeacherMarksState extends State<TeacherMarks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> subjects = ['Maths', 'Physics', 'Hindi', 'English'];
  List<String> examType = ['Sessionals', 'Half-Yearly', 'Finals'];

  bool isLoading = false;
  List<Map<String, dynamic>> studentList = [];
  List marks = [];
  CarouselController buttonCarouselController;
  Widget makeDropDown({List<String> list, onchanged, String type}) {
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
            value: type == "exam" ? widget.currentExamType : "Maths",
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
    print("MAKESTUDENTLIST CALEED");
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: marks.length,
          itemBuilder: (context, index) {
            buttonCarouselController = CarouselController();

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
                              initialPage: 0,
                            ),
                            items: marks[index]['marks'].map<Widget>(
                              (i) {
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
                                              child: TextFormField(
                                                textAlign: TextAlign.center,
                                                onChanged: (value) async {
                                                  print(value);
                                                  int flag = -1;
                                                  Future.forEach(
                                                      marks[index]['marks'],
                                                      (listMarks) {
                                                    flag++;
                                                    if (listMarks[
                                                            'subjectName'] ==
                                                        i['subjectName']) {
                                                      if (value.isNotEmpty) {
                                                        marks[index]['marks']
                                                                    [flag]
                                                                ['marks'] =
                                                            int.parse(value);
                                                        MarksMethod.updateMarks(
                                                          uid: marks[index]
                                                              ['uid'],
                                                          examType: widget
                                                              .currentExamType,
                                                          marks: marks[index]
                                                              ['marks'],
                                                        );
                                                        print(marks[index]
                                                            ['marks']);
                                                      }
                                                    }
                                                  });
                                                },
                                                initialValue:
                                                    i['marks'].toString(),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
                              },
                            ).toList(),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getMarks();
  }

  void getMarks() async {
    setState(() {
      isLoading = true;
    });
    studentList = await MarksMethod.getMarks(widget.clasS);
    await makeMarksList(widget.currentExamType);
    setState(() {
      isLoading = false;
    });
  }

  Future makeMarksList(String examType) async {
    marks = [];
    await Future.forEach(studentList, (student) {
      marks.add({
        'uid': student['uid'],
        'name': student['name'],
        'marks': student['marks'][examType]
      });
    });
    print(marks);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      //drawer: StudentDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection("Users")
              .where("userType", isEqualTo: "student")
              .where("class", isEqualTo: 7)
              .get()
              .then((QuerySnapshot querySnapshot) {
            querySnapshot.docs.forEach((doc) {
              FirebaseFirestore.instance.collection("Users").doc(doc.id).set({
                'marks': {
                  'Sessionals': [
                    {'subjectName': 'Hindi', 'marks': 10},
                    {'subjectName': 'English', 'marks': 15},
                    {'subjectName': 'Maths', 'marks': 20},
                  ],
                  'Half-Yearly': [
                    {'subjectName': 'Hindi', 'marks': 10},
                    {'subjectName': 'English', 'marks': 15},
                    {'subjectName': 'Maths', 'marks': 20},
                  ],
                  'Finals': [
                    {'subjectName': 'Hindi', 'marks': 10},
                    {'subjectName': 'English', 'marks': 15},
                    {'subjectName': 'Maths', 'marks': 20},
                  ]
                }
              }, SetOptions(merge: true));
            });
          });
        },
      ),
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
                      makeDropDown(
                          list: subjects, onchanged: (_) {}, type: "subjects"),
                      makeDropDown(
                          list: examType,
                          onchanged: (value) async {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherMarks(value),
                              ),
                            );
                          },
                          type: "exam")
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                      height: height * 0.65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white.withOpacity(0.7)),
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
                          isLoading
                              ? CircularProgressIndicator()
                              : Expanded(
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
