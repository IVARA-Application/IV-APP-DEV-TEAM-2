import 'package:flutter/material.dart';
import 'package:new_ivara_app/lib.dart';

class EntranceExam extends StatefulWidget {
  EntranceExam({Key key}) : super(key: key);

  @override
  _EntranceExamState createState() => _EntranceExamState();
}

class _EntranceExamState extends State<EntranceExam> {
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
    "NDA",
    "JEE ADVANCE",
    "JEE MAINS",
    "NEET",
    "UPSE",
    "GATE",
    "CLAT",
    "OLYMPIAD",
    "NIFT",
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
                              builder: (_) =>
                                  EntranceExamTopic(topic: exams[i]),
                            ),
                          );
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        shape: kCardShape,
                        title: Text(
                          exams[i],
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
