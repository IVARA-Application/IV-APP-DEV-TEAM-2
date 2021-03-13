import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

class ParentsHomeScreen extends StatelessWidget {
  const ParentsHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: kPBGdecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              imgPath: 'assets/images/teacherlist.png',
              title: 'Teacher List',
              onTap: () {},
            ),
            CustomCard(
              imgPath: 'assets/images/acadmis.png',
              title: 'Academics',
              onTap: () {},
            ),
            CustomCard(
              imgPath: 'assets/images/attendance(1).png',
              title: 'Attendance',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final VoidCallback onTap;
  const CustomCard({
    Key key,
    @required this.imgPath,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          // padding: const EdgeInsets.fromLTRB(20, 15, 10, 0),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imgPath),
              Spacer(flex: 2),
              Text(
                title,
                style: ftt(context).headline5.copyWith(
                      color: kLightBlue,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
