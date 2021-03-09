import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/lib.dart';

class TutionChapter extends StatelessWidget {
  final String subject;

  TutionChapter({Key key, @required this.subject}) : super(key: key);

  final List<String> chapters = [
    'Electric Charges And Fields',
    'Electrostatic Potential And Capacitance',
    'Current Electricity',
    'Moving Charges and Magnetism',
    'Magnetism and Matter',
    'Electromagnetic Induction',
    'Alternating Current',
    'Electromagnetic Waves',
    'Ray Optics and Optical Instruments',
    'Wave Optics',
    'Dual Nature of Radiation and Matter',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
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
                subject,
                style: ftt(context).headline6.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    chapters.length,
                    (i) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: kCardShape,
                          padding: EdgeInsets.all(8),
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                chapters[i],
                                style: ftt(context)
                                    .headline6
                                    .copyWith(color: kLightBlue),
                              ),
                            ),
                            Icon(FontAwesomeIcons.arrowCircleRight,
                                color: kDarkBlue)
                          ],
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
