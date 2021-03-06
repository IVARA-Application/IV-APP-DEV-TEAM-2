import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:new_ivara_app/student_screens/student_homepage/studentHomepage.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    TextEditingController _nameController = TextEditingController();
    
    TextEditingController _passwordController = TextEditingController();
    return  Scaffold(
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
            padding: EdgeInsets.only(top: 30.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Welcome to IVARA",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 500,
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
                      Text(
                        "Please login or sign up to continue using the app",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          hintText: "Enter your name",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Color(0xff898989)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff697ae4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.9),
                          hintText: "Password",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Color(0xff898989)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff697ae4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          // onPrimary: Colors.transparent,
                          // onSurface: Colors.transparent,
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),

                          padding: EdgeInsets.all(0.0),
                          shadowColor: Colors.transparent,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF1835E9),
                                  Color(0xFFF85AC9),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            color: Colors.transparent,
                            constraints: BoxConstraints(
                                maxWidth: 120.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
