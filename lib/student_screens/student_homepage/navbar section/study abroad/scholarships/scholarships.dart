import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../drawer.dart';
import '../../navbar.dart';

class ScholarshipsPage extends StatefulWidget {
  static String id = 'ScholarshipsPage';
  const ScholarshipsPage({Key key}) : super(key: key);

  @override
  _ScholarshipsPageState createState() => _ScholarshipsPageState();
}

class _ScholarshipsPageState extends State<ScholarshipsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: SingleChildScrollView(
        child: Stack(
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
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.09),
                      child: Text(
                        "Scholarships",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.2),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/online-course1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0)),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50.0),
                                          bottomRight: Radius.circular(50.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "GITAM",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.2),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/online-course1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0)),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50.0),
                                          bottomRight: Radius.circular(50.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "VIT",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.2),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/online-course1.png'),
                                    fit: BoxFit.contain,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0)),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.3,
                                color: Colors.transparent,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50.0),
                                          bottomRight: Radius.circular(50.0)),
                                    ),
                                    child: new Center(
                                      child: new Text(
                                        "KLU",
                                        style: TextStyle(
                                            color: Color(0xFF697AE4),
                                            fontSize: 18),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }
}
