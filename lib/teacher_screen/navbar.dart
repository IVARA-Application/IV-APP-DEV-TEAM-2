import 'package:flutter/material.dart';

import 'homepage_screens/profile.dart';

class TeacherNavbar extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  TeacherNavbar(this.scaffoldKey);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState.openDrawer();
                      },
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
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/back.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
  }
}
