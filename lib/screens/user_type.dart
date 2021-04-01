import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/parents_home_screen.dart';
import 'package:new_ivara_app/student_screens/auth/login.dart';
import 'package:new_ivara_app/teacher_screen/teacher_homepage.dart';

class UserType extends StatefulWidget {
  static String id = 'UserType';

  UserType({Key key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

enum ChoiceMethod { student, teacher, parent, none }

class _UserTypeState extends State<UserType> {
  //TODO: Add some logic for different user type
  ChoiceMethod _method = ChoiceMethod.none;

  void foo(userType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LoginPage(
                  userType,
                )));
  }

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
            top: 20.0,
            left: 5.0,
            child: Text(
              'Welcome\nTO\nIVARA',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          Column(
            children: [
              Spacer(),
              Lottie.asset(
                'assets/walking.json',
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Are You!',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.grey),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              UserTypeButton(
                userType: 'Student',
                onTap: () {},
                value: ChoiceMethod.student,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value;
                  });

                  foo("student");
                },
              ),
              UserTypeButton(
                userType: 'Teacher',
                onTap: () {},
                value: ChoiceMethod.teacher,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value;
                  });
                  foo("teacher");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeacherHomepage()));
                },
              ),
              UserTypeButton(
                userType: 'Parent',
                onTap: () {},
                value: ChoiceMethod.parent,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value;
                  });
                  foo("parent");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParentsHomeScreen()));
                },
              ),
              SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}

class UserTypeButton extends StatelessWidget {
  final String userType;
  final Function onTap;
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic) onChanged;

  const UserTypeButton({
    Key key,
    @required this.userType,
    @required this.onTap,
    this.value,
    this.groupValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      shape: kCardShape,
      child: RadioListTile(
        // toggleable: true,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.trailing,
        shape: kCardShape,
        title: Text(
          userType,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: kTextColor1),
          // textAlign: TextAlign.center,
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
