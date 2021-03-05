import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserType extends StatefulWidget {

  static String id = 'UserType';

  UserType({Key key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size.width, size.height),
            painter: TopCurveCustomPainter(),
          ),
          Positioned(
            top: 25.0,
            left: 10.0,
            child: Text(
              'Welcome\nTO\nIVARA',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Lottie.asset(
                  'assets/walking.json',
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
                child: Text(
                  'Are You!',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.grey),
                  // textAlign: TextAlign.center,
                ),
              ),
              UserTypeCard(userType: 'Student', onTap: () {}),
              UserTypeCard(userType: 'Teacher', onTap: () {}),
              UserTypeCard(userType: 'Parent', onTap: () {}),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

class UserTypeCard extends StatelessWidget {
  final String userType;
  final Function onTap;

  const UserTypeCard({
    Key key,
    @required this.userType,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2.0,
        margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                userType,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Color(0xff585858)),
                textAlign: TextAlign.center,
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopCurveCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 17, 132, 224)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, 0),
        Offset(size.width * 0.50, size.height * 0.38),
        [Color(0xffb07ddd), Color(0xfffb8881)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.37);
    path_0.quadraticBezierTo(size.width * 0.14, size.height * 0.38,
        size.width * 0.21, size.height * 0.34);
    path_0.quadraticBezierTo(size.width * 0.25, size.height * 0.33,
        size.width * 0.30, size.height * 0.27);
    path_0.quadraticBezierTo(size.width * 0.38, size.height * 0.19,
        size.width * 0.49, size.height * 0.16);
    path_0.cubicTo(size.width * 0.52, size.height * 0.15, size.width * 0.67,
        size.height * 0.13, size.width * 0.73, size.height * 0.12);
    path_0.quadraticBezierTo(
        size.width * 0.90, size.height * 0.08, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.37);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
