import 'package:flutter/material.dart';
import 'package:new_ivara_app/lib.dart';

class StudentHome extends StatelessWidget {
  Widget makeTab({color, text1, text2, image, height, width, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.2,
        width: height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(height * 0.02)),
          color: color,
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Image.asset(
              image,
              height: height * 0.1,
            ),
            Divider(
              height: height * 0.01,
              thickness: width * 0.005,
              indent: height * 0.04,
              endIndent: height * 0.04,
            ),
            Text(text1),
            Text(text2)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(children: [
        SizedBox(height: height * 0.1),
        Text(
          'Hello,',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: height * 0.04),
        ),
        Text(
          'Ankit Sharma',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: height * 0.04),
        ),
        SizedBox(height: height * 0.07),
        Text(
          'Classroom Dashboard',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: height * 0.03),
        ),
        SizedBox(height: height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            makeTab(
                color: Color(0xFFB9FFFF),
                text1: 'AR',
                text2: 'Labs',
                image: 'assets/arLab.png',
                height: height,
                width: width),
            SizedBox(
              width: width * 0.08,
            ),
            makeTab(
                color: Color(0xFFFFF2AC),
                text1: 'AR',
                text2: 'Classroom',
                image: 'assets/arClassroom.png',
                height: height,
                width: width,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentArClassroom()));
                }
                ),
          ],
        ),
        SizedBox(height: width * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            makeTab(
                color: Color(0xFFF8B461),
                text1: 'Attendance',
                text2: 'Record',
                image: 'assets/attendance1.png',
                height: height,
                width: width),
            SizedBox(
              width: width * 0.08,
            ),
            makeTab(
                color: Color(0xFFD0DBFF),
                text1: 'Academic',
                text2: 'Section',
                image: 'assets/acadmicSection1.png',
                height: height,
                width: width,
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentUpcomingTest()));
                }
                ),
          ],
        ),
      ]),
    );
  }
}
