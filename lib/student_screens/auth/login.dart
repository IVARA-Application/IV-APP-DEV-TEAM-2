import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/shared/custom_elevated_button.dart';
import 'package:new_ivara_app/shared/custom_text_field.dart';
import 'package:new_ivara_app/shared/glassmorphism.dart';
import 'package:new_ivara_app/student_screens/auth/signup.dart';
import 'package:new_ivara_app/student_screens/student_homepage/studentHomepage.dart';

class LoginPage extends StatelessWidget {
  String userType;
  LoginPage(this.userType);
  TextEditingController _nameController = TextEditingController();

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            
            colors: [
              Color(0xFFF85AC9),
              Color(0xFF1835E9),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to\nIVARA",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            GlassmorphicContainer(
              width: MediaQuery.of(context).size.width * 0.8,
              borderRadius: 20,
              blur: 10,
              // alignment: Alignment.bottomCenter,
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
                    Text(
                      "Please login or sign up to continue using the app",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                    CustomTextField(
                      textController: _nameController,
                      hintText: "Enter your name",
                    ),
                    CustomTextField(
                      textController: _textController,
                      hintText: "Password",
                    ),
                    SizedBox(height: 10),
                    CustomElevatedButton(
                        label: "Login",
                        onTap: () {
                          Get.find<AuthController>().signIn(
                              _nameController.text, _textController.text);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => StudentHomePage(0)));
                        }),
                    SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Don't have and account? ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpPage(userType)),
                            );
                          },
                          child: Text(
                            "Click here",
                            style: Theme.of(context)
                                .textTheme
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
          ],
        ),
      ),
    );
  }
}
