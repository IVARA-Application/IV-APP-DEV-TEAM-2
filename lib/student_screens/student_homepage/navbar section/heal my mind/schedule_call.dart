import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/heal%20my%20mind/healMyMindsFunctions/scheduleCallMethods.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../drawer.dart';
import '../navbar.dart';

class ScheduleACallPage extends StatefulWidget {
  static String id = 'ScheduleACallPage';

  @override
  _ScheduleACallPageState createState() => _ScheduleACallPageState();
}

class _ScheduleACallPageState extends State<ScheduleACallPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController slotController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() async {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      await ScheduleACallMethods.onSubmit(
          name: nameController.text,
          phoneNumber: phoneNumberController.text,
          problem: problemController.text,
          slot: slotController.text);
      nameController.text = phoneNumberController.text =
          slotController.text = problemController.text = "";
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  DateTime selectedtime;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  //     stops: [
                  //   0.1,
                  //   0.4,
                  //   0.6,
                  //   0.9
                  // ],
                  colors: [
                    Color(0xFF8569C5),
                    Color(0xFFC579B5),
                    Color(0xFFF48380),
                    Color(0xFFF3D37B),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.09),
                              child: Text(
                                "Schedule A Call",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                  horizontal: screenWidth * 0.07),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Name',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide())),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter name.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                  horizontal: screenWidth * 0.07),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Phone Number',
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                  horizontal: screenWidth * 0.07),
                              child: Container(
                                height: 50,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'E-mail Id',
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter E-mail id';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                  horizontal: screenWidth * 0.07),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            pressed = true;

                                            DatePicker.showDateTimePicker(
                                                context,
                                                showTitleActions: true,
                                                onChanged: (date) {
                                              print(
                                                  'change $date in time zone ' +
                                                      date.timeZoneOffset
                                                          .inHours
                                                          .toString());
                                            }, onConfirm: (date) {
                                              selectedtime = date;
                                            }, currentTime: DateTime.now());
                                          });
                                        },
                                        child: Text(
                                          'Time Slot',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth * 0.05),
                                        )),
                                    pressed
                                        ? _displayDateTime(selectedtime)
                                        : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015,
                                  horizontal: screenWidth * 0.07),
                              child: Container(
                                child: TextFormField(
                                  controller: problemController,
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 0.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Describe The Problem',
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                  maxLines: 4,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please write problem.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.02,
                                  left: screenWidth * 0.55),
                              child: ElevatedButton(
                                onPressed: () {
                                  _saveForm();
                                },
                                style: ElevatedButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                  // onPrimary: Colors.transparent,
                                  // onSurface: Colors.transparent,
                                  primary: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),

                                  padding: EdgeInsets.all(0.0),
                                  shadowColor: Colors.transparent,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF697AE4),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    color: Colors.transparent,
                                    constraints: BoxConstraints(
                                        maxWidth: 120.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Submit',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }

  Widget _displayDateTime(selectedDateTime) {
    return Center(
        child: Text(
      "$selectedtime",
      style: TextStyle(fontSize: 15),
    ));
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}
