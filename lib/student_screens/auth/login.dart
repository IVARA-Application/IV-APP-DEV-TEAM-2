import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:new_ivara_app/lib.dart';
import 'package:new_ivara_app/shared/custom_elevated_button.dart';
import 'package:new_ivara_app/shared/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

    TextEditingController _textController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                  // Color(0xFF8569C5),
                  // Color(0xFFC579B5),
                  Color(0xFFF85AC9),
                  Color(0xFF1835E9),
                ],
              ),
            ),
            // padding: EdgeInsets.only(top: 30.0),
            // child: Align(
            //   alignment: Alignment.topCenter,
            // child: Text(
            //   "Welcome to IVARA",
            //   textAlign: TextAlign.center,
            //   style: Theme.of(context)
            //       .textTheme
            //       .headline2
            //       .copyWith(color: Colors.white),
            // ),
            // ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
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
                  height: MediaQuery.of(context).size.height * 0.55,
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
                        CustomElevatedButton(
                            label: "Login",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentHomePage()));
                            }),
                        Row(
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
                                      builder: (_) => SignUpPage()),
                                );
                              },
                              child: Text(
                                "Click here",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.blue),
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
