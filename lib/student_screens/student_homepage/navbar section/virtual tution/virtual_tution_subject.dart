import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/virtual_tution_chapter.dart';

class TutionCoursesSubject extends StatefulWidget {
  const TutionCoursesSubject({Key key}) : super(key: key);

  @override
  _TutionCoursesSubjectState createState() => _TutionCoursesSubjectState();
}

class _TutionCoursesSubjectState extends State<TutionCoursesSubject> {
  List<String> subjects = [
    'English',
    'Hindi',
    'Maths',
    'Physics',
    'Chemistry',
    'Geography',
    'Arts',
    'Music',
    'Kuch bhi',
    'Kuch aur',
    'Aur kuch',
  ];

  int selectedRadio;
  @override
  void initState() {
    selectedRadio = -1;
    super.initState();
  }

  void setRadioState(int v) {
    setState(() {
      selectedRadio = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        decoration: kBGdecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Virtual Tuition Courses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Chose your subject",
                style: ftt(context).headline6.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    subjects.length,
                    (i) => Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: RadioListTile(
                        value: i,
                        groupValue: selectedRadio,
                        onChanged: (v) {
                          setRadioState(v);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    TutionChapter(subject: subjects[i])),
                          );
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        shape: kCardShape,
                        title: Text(
                          subjects[i],
                          style: ftt(context)
                              .headline5
                              .copyWith(color: kLightBlue),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
