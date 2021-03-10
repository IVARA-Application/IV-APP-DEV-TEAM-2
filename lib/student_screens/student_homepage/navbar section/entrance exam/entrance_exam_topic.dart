import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/skill_development.dart';

class EntranceExamTopic extends StatefulWidget {
  final String topic;
  EntranceExamTopic({Key key, @required this.topic}) : super(key: key);

  @override
  _EntranceExamTopicState createState() => _EntranceExamTopicState();
}

class _EntranceExamTopicState extends State<EntranceExamTopic> {
  int selectedRadio;
  @override
  void initState() {
    selectedRadio = 0;
    super.initState();
  }

  void setRadioState(int v) {
    setState(() {
      selectedRadio = v;
    });
  }

  final List<String> exams = [
    "SCIENCE",
    "MATHS",
    "ENGLISH",
    "CYBER",
    "GENERAL KNOWLEDGE",
    "COMPANY",
    "GEOGRAPHY",
    "HISTORY",
    "POLITICAL SCIENCE",
  ];

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 56),
            Text(
              "Entrance Exam Preparation",
              style: ftt(context).headline5.copyWith(color: Colors.white),
            ),
            Text(
              widget.topic,
              style: ftt(context)
                  .headline5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    9,
                    (i) => InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SkillDevelopment()),
                        );
                      },
                      child: Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                exams[i],
                                style: ftt(context)
                                    .headline5
                                    .copyWith(color: kLightBlue),
                              ),
                              Icon(FontAwesomeIcons.solidPlayCircle,
                                  color: kYellow)
                            ],
                          ),
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
