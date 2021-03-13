import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

class SkillDevelopment extends StatelessWidget {
  SkillDevelopment({Key key}) : super(key: key);

  // final List<String> chapters = [
  //   'Electric Charges And Fields',
  //   'Electrostatic Potential And Capacitance',
  //   'Current Electricity',
  //   'Moving Charges and Magnetism',
  //   'Magnetism and Matter',
  //   'Electromagnetic Induction',
  //   'Alternating Current',
  //   'Electromagnetic Waves',
  //   'Ray Optics and Optical Instruments',
  //   'Wave Optics',
  //   'Dual Nature of Radiation and Matter',
  // ];

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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Skill Development\nCourses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                child: Text(
                  'Techinical',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        wordSpacing: 5,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 4; i++)
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Subject',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                child: Text(
                  'Techinical',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        wordSpacing: 5,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 4; i++)
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Subject',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                child: Text(
                  'Non-Techinical',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        wordSpacing: 5,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 4; i++)
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Subject',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                child: Text(
                  'Activities',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        wordSpacing: 5,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 4; i++)
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Subject',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                child: Text(
                  'Management',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        wordSpacing: 10,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < 4; i++)
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Subject',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
