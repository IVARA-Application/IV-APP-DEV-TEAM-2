import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';

class ARTopics extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String cls;
  String subject;
  Map<String, Map<String, List>> topics = {
    '4th': {},
    '5th': {},
    '6th': {},
    '7th': {},
    '8th': {},
    '9th': {
      'Physics': ['Ear', 'Launch Rocket Science', 'Oscillator'],
      'Chemistry': [],
      'Biology': ['Virus', 'Plant Cell'],
      'SST': ['Preamble', 'Mountain', 'Major Countries of first World War'],
    },
    '10th': {},
    '11th': {
      'Biology': [
        'Museums',
        'Zoological Park',
        '3 Domains of Life',
        'Herbaria',
        'Gymnospermae',
        'Bio Diversity',
        'Kingdom',
        'Archbacteria',
        'Bacteria Division',
        'Eubacteria',
        'Bases on shapes(Monera)',
        'Virus Reduced Poly Count',
        'Protozoan',
        'Viroids',
        'Pteridophyta',
        'Prions Proteins',
        'Gymnospermae - 1',
      ],
      'Geography': [
        'Sea Floor',
        'Universal Element Formation',
      ],
      'History': [
        'Colosseum',
        'Homo Erectus Skull',
        'Cinder Cone',
        'Ape Skull',
        'Al-Malik coinage',
        'Australopithecus Skull',
        'Ruins at Greek city of Corinth',
        'Spear Thrower',
        'Qublai Khan and Chabi in camp'
      ]
    },
    '12th': {},
  };
  ARTopics({cls, subject}) {
    this.cls = cls;
    this.subject = subject;
  }
  Map<String, int> sceneNumber = {
    'Ear': 1,
    'Launch Rocket Science': 2,
    'Oscillator': 3,
    'Virus': 4,
    'Plant Cell': 7,
    'Major Countries of first World War': 8,
    'Preamble': 5,
    'Mountain': 6,
    'Museums': 10,
    'Zoological Park': 11,
    '3 Domains of Life': 12,
    'Herbaria': 13,
    'Gymnospermae': 14,
    'Bio Diversity': 15,
    'Kingdom': 16,
    'Archbacteria': 17,
    'Bacteria Division': 18,
    'Eubacteria': 19,
    'Bases on shapes(Monera)': 20,
    'Sea Floor': 21,
    'Virus Reduced Poly Count': 22,
    'Protozoan': 23,
    'Viroids': 24,
    'Pteridophyta': 25,
    'Prions Proteins': 26,
    'Gymnospermae - 1': 27,
    'Universal Element Formation': 28,
    'Colosseum': 29,
    'Homo Erectus Skull': 30,
    'Cinder Cone': 31,
    'Ape Skull': 32,
    'Al-Malik coinage': 33,
    'Australopithecus Skull': 34,
    'Ruins at Greek city of Corinth': 35,
    'Spear Thrower': 36,
    'Qublai Khan and Chabi in camp': 37,
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Color(0xFF8569C5),
                    Color(0xFFC579B5),
                    Color(0xFFF48380),
                    Color(0xFFF3d37B),
                  ],
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Text(
                    'Class $cls',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: height * 0.03),
                  ),
                  SizedBox(height: height * 0.03),
                  Expanded(
                    child: ListView.builder(
                        itemCount: topics[cls][subject].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              MethodChannel channel = MethodChannel("channel");
                              channel.invokeMethod("openUnityClass6", {
                                'arguments':
                                    sceneNumber[topics[cls][subject][index]]
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height * 0.015,
                                  horizontal: width * 0.08),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                width: width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(height * 0.01),
                                    color: Colors.white),
                                child: Center(
                                    child: Text(topics[cls][subject][index],
                                        style: TextStyle(
                                            color: kDarkBlue,
                                            fontSize: height * 0.028))),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            Positioned(
                height: height * 0.08,
                width: width,
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset('assets/drawer.png')),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Image.asset('assets/back.png')),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
