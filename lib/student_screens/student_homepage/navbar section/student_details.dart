import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

List<String> details = [
  'Aman Nanda',
  '2255887799',
  'aman@gmail.com',
  '2255887799',
  'aman@gmail.com',
  'ABC12345'
];

class StudentDetails extends StatelessWidget {
  StudentDetails({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        decoration: kBGdecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Student Details",
                style: ftt(context).headline5.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            for (var i in details) ReadOnlyTextField(textValue: i),
          ],
        ),
      ),
    );
  }
}

class ReadOnlyTextField extends StatelessWidget {
  final String textValue;
  const ReadOnlyTextField({
    Key key,
    @required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        readOnly: true,
        enabled: true,
        decoration: InputDecoration(
          hintText: textValue,
          hintStyle: ftt(context).bodyText2.copyWith(color: Colors.white),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(borderSide: BorderSide()),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
