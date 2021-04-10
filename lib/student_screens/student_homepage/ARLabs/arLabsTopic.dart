import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';

class ARLabsTopics extends StatelessWidget {
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
      'Physics': [],
      'Chemistry': [],
      'Biology': [],
      'SST': [],
    },
    '10th': {
      'Physics': [
        'Ohm\'s Law',
        'Parallel Connections',
        'Experiment 7',
        'Experiment Lens',
        'Refraction through glass',
        'Refraction through prism_10th',
        'Series Connection',
        'Series Individual',
      ],
    },
    '11th': {'Biology': [], 'Geography': [], 'History': []},
    '12th': {
      'Physics': [
        'Resistance per CM',
        'Meter Bridge Resistivity and Resistance',
        'Verify Series Combination',
        'Verify Parallel Combination',
        'Compate EMF',
        'Internal Resistance with Potentiometer',
        'Galvanometer to Ammeter',
        'Refraction through prism_12th',
        'Experiment 1'
      ]
    },
  };
  ARLabsTopics({cls, subject}) {
    this.cls = cls;
    this.subject = subject;
  }
  Map<String, int> sceneNumber = {
    'Ohm\'s Law': 38,
    'Parallel Connections': 39,
    'Parallel Individual': 40,
    'Experiment 7': 41,
    'Experiment Lens': 42,
    'Refraction through glass slab': 43,
    'Refraction through prism_10th': 44,
    'Series Connection': 45,
    'Series Individual': 46,
    'Resistance per CM': 47,
    'Meter Bridge Resistivity and Resistance': 48,
    'Verify Series Combination': 49,
    'Verify Parallel Combination': 50,
    'Compate EMF': 51,
    'Internal Resistance with Potentiometer': 52,
    'Galvanometer to Ammeter': 53,
    'Refraction through prism_12th': 54,
    'Experiment 1': 55,
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
