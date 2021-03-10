import 'package:flutter/material.dart';
import 'package:new_ivara_app/lib.dart';

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
            SizedBox(height: 100),
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
