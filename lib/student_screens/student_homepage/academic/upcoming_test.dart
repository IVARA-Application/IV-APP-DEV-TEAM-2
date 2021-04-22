import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/academic/test_card.dart';

class TestPage extends StatefulWidget {
  static String id = 'TestPage';
  const TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CountDownController _controller = CountDownController();

  int index = 0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<TestCard> testCard = [
      TestCard(subject: 'Physics', topic: 'Refraction', seconds: 700),
      TestCard(subject: 'Maths', topic: 'Integral', seconds: 15200),
      TestCard(subject: 'Chemistry', topic: 'Carbon', seconds: 2200),
      TestCard(subject: 'Biology', topic: 'Plants', seconds: 500)
    ];
    Widget testCardTemplate(testCard) {
      return TestCardWidget(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        controller: _controller,
        testCard: testCard,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //     stops: [
                //   0.1,
                //   0.4,
                //   0.6,
                //   0.9
                // ],
                colors: [
                  Color(0xFF8569C5),
                  Color(0xFFC579B5),
                  Color(0xFFF48380),
                  Color(0xFFF3D37B),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/icons/tab.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/icons/back.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    child: Text(
                      "Upcoming Test Schedule",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(
                        children: testCard
                            .map((TestCard) => testCardTemplate(TestCard))
                            .toList()),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
