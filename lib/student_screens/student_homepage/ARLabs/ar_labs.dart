import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';

import '../../drawer.dart';
import 'ar_class.dart';

class ARLabs extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<String> classes = ['9th', '10th', '11th', '12th'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: kBGdecoration,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  'AR Labs',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: height * 0.03),
                ),
                Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      padding: EdgeInsets.all(height * 0.05),
                      mainAxisSpacing: height * 0.02,
                      crossAxisSpacing: width * 0.03,
                      children: classes.map((String cls) {
                        return GridTile(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(ARLabsTopic(cls: cls));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(height * 0.005),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(height * 0.01),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Class $cls',
                                        style: TextStyle(color: kDarkBlue)),
                                    SizedBox(width: width * 0.03),
                                    Image.asset('assets/class.png')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                ),
              ],
            ),
          ),
          Positioned(
            top:height*0.03,
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
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/back.png')),
                ],
              )),
          // Positioned(
          //   top: height * 0.85,
          //   left: width * 0.05,
          //   child: Container(
          //       decoration: BoxDecoration(
          //         borderRadius:
          //             BorderRadius.all(Radius.circular(height * 0.1)),
          //         color: Color(0xFF697AE4),
          //       ),
          //       width: width * 0.9,
          //       height: height * 0.08,
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   currentIndex = 0;
          //                 });
          //               },
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(
          //                             Radius.circular(height)),
          //                         color: currentIndex == 0
          //                             ? Colors.white
          //                             : Colors.transparent),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(
          //                           currentIndex == 0 ? height * 0.007 : 0),
          //                       child: Center(
          //                         child: Image.asset('assets/home.png',
          //                             height: currentIndex == 0
          //                                 ? height * 0.02
          //                                 : height * 0.03,
          //                             color: currentIndex == 0
          //                                 ? Color(0xFF08F7F8)
          //                                 : Colors.white),
          //                       ),
          //                     ),
          //                   ),
          //                   Spacer(),
          //                   Text('Home',
          //                       style: TextStyle(
          //                           fontSize: height * 0.015,
          //                           color: Colors.white))
          //                 ],
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   currentIndex = 1;
          //                 });
          //               },
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(
          //                             Radius.circular(height)),
          //                         color: currentIndex == 1
          //                             ? Colors.white
          //                             : Colors.transparent),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(
          //                           currentIndex == 1 ? height * 0.007 : 0),
          //                       child: Center(
          //                         child: Image.asset(
          //                             'assets/notification.png',
          //                             height: currentIndex == 1
          //                                 ? height * 0.02
          //                                 : height * 0.03,
          //                             color: currentIndex == 1
          //                                 ? Color(0xFF08F7F8)
          //                                 : Colors.white),
          //                       ),
          //                     ),
          //                   ),
          //                   Spacer(),
          //                   Text('Notification',
          //                       style: TextStyle(
          //                           fontSize: height * 0.015,
          //                           color: Colors.white))
          //                 ],
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   currentIndex = 2;
          //                 });
          //               },
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(
          //                             Radius.circular(height)),
          //                         color: currentIndex == 2
          //                             ? Colors.white
          //                             : Colors.transparent),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(
          //                           currentIndex == 2 ? height * 0.007 : 0),
          //                       child: Center(
          //                         child: Image.asset('assets/calendar.png',
          //                             height: currentIndex == 2
          //                                 ? height * 0.02
          //                                 : height * 0.03,
          //                             color: currentIndex == 2
          //                                 ? Color(0xFF08F7F8)
          //                                 : Colors.white),
          //                       ),
          //                     ),
          //                   ),
          //                   Spacer(),
          //                   Text('Calendar',
          //                       style: TextStyle(
          //                           fontSize: height * 0.015,
          //                           color: Colors.white))
          //                 ],
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   currentIndex = 3;
          //                 });
          //               },
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(
          //                             Radius.circular(height)),
          //                         color: currentIndex == 3
          //                             ? Colors.white
          //                             : Colors.transparent),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(
          //                           currentIndex == 3 ? height * 0.007 : 0),
          //                       child: Center(
          //                         child: Image.asset('assets/chat.png',
          //                             height: currentIndex == 3
          //                                 ? height * 0.02
          //                                 : height * 0.03,
          //                             color: currentIndex == 3
          //                                 ? Color(0xFF08F7F8)
          //                                 : Colors.white),
          //                       ),
          //                     ),
          //                   ),
          //                   Spacer(),
          //                   Text('Chat',
          //                       style: TextStyle(
          //                           fontSize: height * 0.015,
          //                           color: Colors.white))
          //                 ],
          //               ),
          //             ),
          //             TextButton(
          //               onPressed: () {
          //                 setState(() {
          //                   currentIndex = 4;
          //                 });
          //               },
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.all(
          //                             Radius.circular(height)),
          //                         color: currentIndex == 4
          //                             ? Colors.white
          //                             : Colors.transparent),
          //                     child: Padding(
          //                       padding: EdgeInsets.all(
          //                           currentIndex == 4 ? height * 0.007 : 0),
          //                       child: Center(
          //                         child: Image.asset('assets/report.png',
          //                             height: currentIndex == 4
          //                                 ? height * 0.02
          //                                 : height * 0.03,
          //                             color: currentIndex == 4
          //                                 ? Color(0xFF08F7F8)
          //                                 : Colors.white),
          //                       ),
          //                     ),
          //                   ),
          //                   Spacer(),
          //                   Text('Report',
          //                       style: TextStyle(
          //                           fontSize: height * 0.015,
          //                           color: Colors.white))
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       )),
          // )
        ],
      ),
    );
  }
}
