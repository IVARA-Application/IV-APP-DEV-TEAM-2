import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/student_screens/student_homepage/chat/chat_subject_group.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/24X7DoubtPortal/24X7_doubt.dart';

List subjects = [
  {'subjectName': 'Physics', 'icon': 'assets/subject.png'},
  {'subjectName': 'Chemistry', 'icon': 'assets/subject.png'},
  {'subjectName': 'Biology', 'icon': 'assets/subject.png'},
  {'subjectName': 'Maths', 'icon': 'assets/subject.png'},
  {'subjectName': 'English', 'icon': 'assets/subject.png'},
  {'subjectName': 'Social Science', 'icon': 'assets/subject.png'},
  {'subjectName': 'Hindi', 'icon': 'assets/subject.png'},
];

class StudentChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.12,
        ),
        SizedBox(
          height: height * 0.7,
          child: Container(
            child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.008, horizontal: width * 0.1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubjectChatPage(
                                  subjectName: subjects[i]['subjectName'],
                                )));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.009),
                          child: Row(
                            children: [
                              Text(subjects[i]['subjectName'],
                                  style: TextStyle(fontSize: height * 0.03)),
                              Spacer(),
                              Image.asset(subjects[i]['icon'])
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
