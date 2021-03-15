import 'package:flutter/material.dart ';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

List<Map<String, String>> _teacherinfo = [
  {
    'name': 'Samrithi',
    'designation': 'class teacher',
    'subject': 'maths',
  },
  {
    'name': 'Divyansh',
    'designation': null,
    'subject': 'English',
  },
  {
    'name': 'Pavani',
    'designation': null,
    'subject': 'Maths',
  },
  {
    'name': 'Aman',
    'designation': null,
    'subject': 'Phyics',
  },
];

class TeachersList extends StatelessWidget {
  const TeachersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: [
            SizedBox(height: 80),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (var teacher in _teacherinfo)
                    TeachersCard(
                      teacherName: teacher['name'],
                      subject: teacher['subject'],
                      designation: teacher['designation'],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeachersCard extends StatelessWidget {
  final String teacherName;
  final String designation;
  final String subject;
  const TeachersCard({
    Key key,
    @required this.teacherName,
    this.designation,
    @required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
        minLeadingWidth: 20,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPurple,
          ),
          width: 20,
        ),
        title: Text(
          teacherName,
          style: ftt(context).headline5.copyWith(
                color: kPurple,
                fontWeight: FontWeight.w700,
              ),
        ),
        subtitle: Text(
          designation ?? '  ',
          style: ftt(context).bodyText1.copyWith(
                color: kPurple,
              ),
        ),
        trailing: Text(
          subject,
          style: ftt(context).headline6.copyWith(
                color: kPurple,
              ),
        ),
      ),
    );
  }
}
