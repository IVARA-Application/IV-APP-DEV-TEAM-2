import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/parents_home_screen.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

List<Map<String, dynamic>> courses = [
  {
    'course': 'Technical',
    'subject': ['Subject', 'Subject', 'Subject', 'Subject'],
  },
  {
    'course': 'Non-Technical',
    'subject': ['Subject', 'Subject', 'Subject', 'Subject'],
  },
  {
    'course': 'Activites',
    'subject': ['Subject', 'Subject', 'Subject', 'Subject'],
  },
  {
    'course': 'Management',
    'subject': ['Subject', 'Subject', 'Subject', 'Subject'],
  },
];

class SkillDevelopment extends StatelessWidget {
  SkillDevelopment({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: kBGdecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Skill Development\nCourses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            for (var course in courses) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5.0),
                  child: Text(
                    course['course'],
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                          wordSpacing: 10,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var sub in course['subject']) ...[
                        ElevatedButton(
                          onPressed: () {
                            Get.to(ParentsHomeScreen());
                          },
                          child: Text(
                            sub,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            visualDensity: VisualDensity.compact,
                          ),
                        ),
                        SizedBox(width: 20),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
