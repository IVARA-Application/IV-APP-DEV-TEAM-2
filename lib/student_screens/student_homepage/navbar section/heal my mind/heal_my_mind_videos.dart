import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HealMyMindVideosPage extends StatefulWidget {
  static String id = 'HealMyMindVideosPage';
  @override
  _HealMyMindVideosPageState createState() => _HealMyMindVideosPageState();
}

class _HealMyMindVideosPageState extends State<HealMyMindVideosPage> {


  @override
  Widget build(BuildContext context) {
    int index = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
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
                    Column(
                      children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.035),
                            child: Text(
                              "Heal My Mind Videos",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top:screenWidth*0.07,
                              left: screenWidth*0.07
                              ),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: screenHeight*0.12,
                                      width: screenWidth*0.38,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/thumbnail.jpg'),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
                                          ),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft:
                                                    Radius.circular(10.0)),
                                      ),
                                    ),
                                    Positioned(
                                      child: Icon(
                                        Icons.play_arrow,color: Colors.white,
                                        size: 80,
                                        ),
                                        top: screenHeight*0.025,
                                        left: screenWidth*0.055,
                                    )
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: screenHeight*0.12,
                                      width: screenWidth*0.48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0)),
                                      ),
                                    ),
                                    Positioned(
                                      child: Text("Title",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25
                                      ),
                                      ),
                                        top: screenHeight*0.04,
                                        left: screenWidth*0.04,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
                )
            )
        ],
      ),
    );
  }
}
