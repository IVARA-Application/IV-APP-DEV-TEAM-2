import 'package:flutter/material.dart';

class StudentNavbar extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  StudentNavbar(this.scaffoldKey);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
        height: height * 0.08,
        width: width,
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Image.asset('assets/drawer.png')),
            Spacer(),
            TextButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                child: Image.asset('assets/back.png')),
          ],
        ));
  }
}
