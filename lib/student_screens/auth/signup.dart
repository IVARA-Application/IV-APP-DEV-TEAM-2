import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:new_ivara_app/lib.dart';
import 'package:new_ivara_app/shared/custom_elevated_button.dart';
import 'package:new_ivara_app/shared/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'SignupPage';
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();

    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();

    TextEditingController _passwordController = TextEditingController();
    TextEditingController _retypePasswordController = TextEditingController();

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
          ),
          SafeArea(
            child: Center(
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        passwordController: _nameController,
                        hintText: "Enter your name",
                      ),
                      CustomTextField(
                        passwordController: _emailController,
                        hintText: "Enter email",
                      ),
                      CustomTextField(
                        passwordController: _phoneController,
                        hintText: "Enter phone no.",
                      ),
                      CustomTextField(
                        passwordController: _passwordController,
                        hintText: "Enter your Password",
                      ),
                      CustomTextField(
                        passwordController: _retypePasswordController,
                        hintText: "Retype Password",
                      ),
                      CustomElevatedButton(label: "Register", onTap: () {}),
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
                            fillColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          Flexible(
                            child: Text(
                              'I agree with all the terms and condion',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an account? ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => LoginPage()),
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
            ),
          ),
        ],
      ),
    );
  }
}
