import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/parent_screens/parents_home_screen.dart';

List subjects = [
  {'subjectName': 'Subject 1', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 2', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 3', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 4', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 5', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 6', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 7', 'icon': 'assets/subject.png'},
  {'subjectName': 'Subject 8', 'icon': 'assets/subject.png'},
];

class StudentChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
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
                        Get.to(ParentsHomeScreen());
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
