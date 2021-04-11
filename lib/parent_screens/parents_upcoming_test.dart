import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/drawer.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/shared/glow_circle_avatar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/academic/test_card.dart';

import 'navbar.dart';
class ParentsUpcomingTests extends StatefulWidget {
  @override
  _ParentsUpcomingTestsState createState() => _ParentsUpcomingTestsState();
}

class _ParentsUpcomingTestsState extends State<ParentsUpcomingTests> {
  CountDownController _controller = CountDownController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      drawer: ParentDrawer(),
      key:_scaffoldKey,
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
          child:SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(
                children: <Widget>[
                  ParentNavbar(_scaffoldKey),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Text(
                      "Upcoming Tests",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Column(
                      children: testCard
                          .map((TestCard) => testCardTemplate(TestCard))
                          .toList())
                ],
              ),
            )),
          ),)
        ],
      ),
    );
  }

}
// class ParentsUpcomingTests extends StatelessWidget {
//   const ParentsUpcomingTests({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         leading: CustomIconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           GlowCircleAvatar(
//             onTap: () {},
//             imageProvider: AssetImage('assets/icons/profile.jpg'),
//           ),
//         ],
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//       ),



//        body: Container(
//         decoration: kPBGdecoration,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
          
//           ],
//         ),
//       ),
//     );
//   }
// }
