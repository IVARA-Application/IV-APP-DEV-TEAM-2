import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/parent_screens/parents_upcoming_test.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/shared/glow_circle_avatar.dart';

class ParentAcademicSection extends StatefulWidget {
  @override
  _ParentAcademicSectionState createState() => _ParentAcademicSectionState();
}

class _ParentAcademicSectionState extends State<ParentAcademicSection> {
  List tests = [
    {'testNo': '1', 'totalMarks': '20', 'marksObtained': '14'},
    {'testNo': '2', 'totalMarks': '20', 'marksObtained': '16'},
    {'testNo': '3', 'totalMarks': '20', 'marksObtained': '18'},
    {'testNo': '4', 'totalMarks': '20', 'marksObtained': '10'},
    {'testNo': '5', 'totalMarks': '20', 'marksObtained': '20'},
    {'testNo': '6', 'totalMarks': '20', 'marksObtained': '17'},
    {'testNo': '7', 'totalMarks': '20', 'marksObtained': '14'},
    {'testNo': '8', 'totalMarks': '20', 'marksObtained': '15'},
  ];
  double currentPos=100;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
  }
  List<String> subjects = ['Physics','Chemistry','Maths'];
  Widget makeDropDown({List<String> list, onchanged,height}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: true,
        elevation: 0,
        hint: Text(list[0], style: TextStyle(color: kDarkBlue, fontSize: height * 0.025)),
        icon: Icon(Icons.keyboard_arrow_down),
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GlowCircleAvatar(
            onTap: () {},
            imageProvider: AssetImage('assets/icons/profile.jpg'),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: kPBGdecoration,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.15),
              Text('Academic Section',
                  style: TextStyle(
                      fontSize: height * 0.03,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: height * 0.015),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
                color: Colors.transparent,
                child: Container(
                    height: height * 0.18,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height * 0.015)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomCenter,
                        stops: [0.15, 0.45, 0.75, 1.0],
                        colors: [
                          Color(0xFFFEFDFE).withOpacity(0.8),
                          Color(0xFFD3C6E3).withOpacity(0.8),
                          Color(0xFFBAA3D4).withOpacity(0.9),
                          Color(0xFFA97BBA).withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.05),
                          child: Row(
                            children: [
                             makeDropDown(list:subjects,onchanged: (_){},height:height),
                              Spacer(),
                              Text(
                                '72/100',
                                style: TextStyle(
                                    color: kDarkBlue, fontSize: height * 0.025),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Expanded(
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollController,
                                      children: tests.map((item) {
                                        return Padding(
                                          padding:
                                              EdgeInsets.all(height * 0.01),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          height * 0.01),
                                                  color: Colors.white),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    height * 0.01),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        'Test ' +
                                                            item['testNo'],
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFF8B461),
                                                        )),
                                                    Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    height *
                                                                        0.003),
                                                        width: width * 0.06,
                                                        height: 2,
                                                        color: kLightBlue
                                                            .withOpacity(0.5)),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            item['marksObtained'] +
                                                                '/',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFF8B461),
                                                            )),
                                                        Text(item['totalMarks'],
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFFFF2609)))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )),
                                        );
                                      }).toList())),
                              GestureDetector(
                                onTap:(){
                                  _scrollController.animateTo(currentPos, duration: new Duration(seconds: 2), curve: Curves.ease);
                                  currentPos=currentPos+100;
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: height * 0.05,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(height: height * 0.04),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
                color: Colors.transparent,
                child: Container(
                    height: height * 0.1,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height * 0.015)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomCenter,
                        stops: [0.15, 0.45, 0.75, 1.0],
                        colors: [
                          Color(0xFFFEFDFE).withOpacity(0.8),
                          Color(0xFFFAE3E6).withOpacity(0.8),
                          Color(0xFFF6C5CD).withOpacity(0.9),
                          Color(0xFFED919F).withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          Text('Subject Wise Analysis',
                              style: TextStyle(fontSize: height * 0.025)),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right,
                              size: height * 0.05, color: Colors.white)
                        ],
                      ),
                    )),
              ),
              SizedBox(height: height * 0.03),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.all(Radius.circular(height * 0.015)),
                color: Colors.transparent,
                child: Container(
                    height: height * 0.11,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(height * 0.015)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomCenter,
                        stops: [0.15, 0.45, 0.75, 1.0],
                        colors: [
                          Color(0xFFFEFDFE).withOpacity(0.8),
                          Color(0xFFFAE3E6).withOpacity(0.8),
                          Color(0xFFF6C5CD).withOpacity(0.9),
                          Color(0xFFED919F).withOpacity(0.9),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          Text('Overall Analysis',
                              style: TextStyle(fontSize: height * 0.025)),
                          Spacer(),
                          Icon(Icons.keyboard_arrow_right,
                              size: height * 0.05, color: Colors.white)
                        ],
                      ),
                    )),
              ),
              SizedBox(height: height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParentsUpcomingTests()));
                },
                child: Material(
                  elevation: 5,
                  borderRadius:
                      BorderRadius.all(Radius.circular(height * 0.015)),
                  color: Colors.transparent,
                  child: Container(
                      height: height * 0.11,
                      width: width * 0.85,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(height * 0.015)),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomCenter,
                          stops: [0.15, 0.45, 0.75, 1.0],
                          colors: [
                            Color(0xFFFEFDFE).withOpacity(0.8),
                            Color(0xFFFAE3E6).withOpacity(0.8),
                            Color(0xFFF6C5CD).withOpacity(0.9),
                            Color(0xFFED919F).withOpacity(0.9),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Row(
                          children: [
                            Text('Upcoming Test Schedule',
                                style: TextStyle(fontSize: height * 0.025)),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_right,
                                size: height * 0.05, color: Colors.white)
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
