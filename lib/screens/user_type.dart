import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_ivara_app/lib.dart';

class UserType extends StatefulWidget {
  static String id = 'UserType';

  UserType({Key key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

enum ChoiceMethod { student, teacher, parent, none }

class _UserTypeState extends State<UserType> {
  ChoiceMethod _method = ChoiceMethod.none;

  //TODO: Add some logic for different user type

  void foo() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
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
                  foo();
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
                  foo();
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
                  foo();
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

class UserTypeButton extends StatefulWidget {
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
  _UserTypeButtonState createState() => _UserTypeButtonState();
}

class _UserTypeButtonState extends State<UserTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.userType,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Color(0xff585858)),
                textAlign: TextAlign.center,
              ),
              Radio(
                // value: ChoiceMethod.parent,
                value: widget.value,
                groupValue: widget.groupValue,
                onChanged: widget.onChanged,
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
