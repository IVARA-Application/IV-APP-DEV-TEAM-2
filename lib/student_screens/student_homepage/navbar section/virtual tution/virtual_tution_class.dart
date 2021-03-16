import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/virtual_tution_subject.dart';

class TutionClasses extends StatefulWidget {
  const TutionClasses({Key key}) : super(key: key);

  @override
  _TutionClassesState createState() => _TutionClassesState();
}

class _TutionClassesState extends State<TutionClasses> {
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
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Virtual Tuition Courses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    9,
                    (i) => Card(
                      elevation: 4.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: RadioListTile(
                        value: i,
                        groupValue: selectedRadio,
                        toggleable: true,
                        onChanged: (v) {
                          setRadioState(v);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TutionCoursesSubject()),
                          );
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        shape: kCardShape,
                        title: Text(
                          "CLASS ${i + 4}TH",
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
