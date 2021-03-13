import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class ScheduleACallPage extends StatefulWidget {
  static String id = 'ScheduleACallPage';

  @override
  _ScheduleACallPageState createState() => _ScheduleACallPageState();
}

class _ScheduleACallPageState extends State<ScheduleACallPage> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
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
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/icons/back.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.035),
                            child: Text(
                              "Schedule A Call",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
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
                                    labelText: 'Name',
                                    labelStyle: TextStyle(color: Colors.white),
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
                                decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(color: Colors.white)),
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
                              height: 62,
                              child: DropDownFormField(
                                titleText: 'Book Slot',
                                hintText: 'Please choose one',
                                value: _myActivity,
                                onSaved: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _myActivity = value;
                                  });
                                },
                                dataSource: [
                                  {
                                    "display": "9-10 AM",
                                    "value": "9-10 AM",
                                  },
                                  {
                                    "display": "10-11 AM",
                                    "value": "10-11 AM",
                                  },
                                  {
                                    "display": "11-12 PM",
                                    "value": "11-12 PM",
                                  },
                                  {
                                    "display": "12-1 PM",
                                    "value": "12-1 PM",
                                  },
                                  {
                                    "display": "1-2 PM",
                                    "value": "1-2 PM",
                                  },
                                  {
                                    "display": "2-3 PM",
                                    "value": "2-3 PM",
                                  },
                                  {
                                    "display": "3-4 PM",
                                    "value": "3-4 PM",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.015,
                                horizontal: screenWidth * 0.07),
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelText: 'Describe The Problem',
                                    labelStyle: TextStyle(color: Colors.white)),
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
                            padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.55),
                            child: ElevatedButton(
                              onPressed: () {
                                _saveForm();
                              },
                              style: ElevatedButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                                // onPrimary: Colors.transparent,
                                // onSurface: Colors.transparent,
                                primary: Colors.transparent,
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

                                padding: EdgeInsets.all(0.0),
                                shadowColor: Colors.transparent,
                              ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF697AE4),
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    color: Colors.transparent,
                                    constraints: BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Submit',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
