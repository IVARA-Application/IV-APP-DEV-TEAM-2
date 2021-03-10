import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_elevated_button.dart';
import 'package:new_ivara_app/shared/custom_text_field.dart';
import 'package:new_ivara_app/student_screens/auth/login.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/entrance%20exam/entrance_exam.dart';

class SignUpPage extends StatefulWidget {
  String userType;
  SignUpPage(this.userType);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isCheck = false;
  TextEditingController _nameC = TextEditingController();
  TextEditingController _emailC = TextEditingController();
  TextEditingController _phoneC = TextEditingController();
  TextEditingController _passC = TextEditingController();
  TextEditingController _repassC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPink,
                  kDarkBlue,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Welcome to IVARA",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white),
                  ),
                ),
                GlassmorphicContainer(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.7,
                  borderRadius: 20,
                  blur: 10,
                  alignment: Alignment.bottomCenter,
                  border: 2,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color((0xFFFFFFFF)).withOpacity(0.2),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          textController: _nameC,
                          hintText: "Enter your name",
                        ),
                        CustomTextField(
                          textController: _emailC,
                          hintText: "Enter email",
                        ),
                        CustomTextField(
                          textController: _phoneC,
                          hintText: "Enter phone no.",
                        ),
                        CustomTextField(
                          textController: _passC,
                          hintText: "Enter your Password",
                        ),
                        CustomTextField(
                          textController: _repassC,
                          hintText: "Retype Password",
                        ),
                        CustomElevatedButton(
                            label: "Register",
                            onTap: () {
                              Get.find<AuthController>().signup(
                                  _emailC.text, _passC.text, widget.userType);
                            }),
                        Row(
                          children: [
                            Checkbox(
                              value: isCheck,
                              onChanged: (value) {
                                setState(() {
                                  isCheck = !isCheck;
                                });
                              },
                              checkColor: Colors.green,
                              visualDensity: VisualDensity.compact,
                              fillColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            Flexible(
                              child: Text(
                                'I agree with all the terms and condion',
                                style: ftt(context).bodyText1,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: ftt(context)
                                  .bodyText1
                                  .copyWith(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          LoginPage(widget.userType)),
                                );
                              },
                              child: Text(
                                "Click here",
                                style: ftt(context)
                                    .bodyText1
                                    .copyWith(color: kPink),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
