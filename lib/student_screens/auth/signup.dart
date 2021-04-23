import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_elevated_button.dart';
import 'package:new_ivara_app/shared/custom_text_field.dart';
import 'package:new_ivara_app/shared/glassmorphism.dart';
import 'package:new_ivara_app/student_screens/auth/login.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/entrance%20exam/entrance_exam.dart';

class SignUpPage extends StatelessWidget {
  final String userType;
  SignUpPage(this.userType);

  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _emailC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _passC = TextEditingController();
  final TextEditingController _repassC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    bool isCheck = false;
    bool isHidden1 = true;
    bool isHidden2 = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _nameC,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.all(2),
                            isDense: true,

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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _emailC,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.all(2),
                            isDense: true,

                            focusColor: Colors.white,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            hintText: "Enter email",
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _phoneC,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => node.nextFocus(),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.all(2),
                            isDense: true,

                            focusColor: Colors.white,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.9),
                            hintText: "Enter phone no.",
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StatefulBuilder(
                            builder: (context, StateSetter setState) {
                          return TextFormField(
                            controller: _passC,
                            obscureText: isHidden1,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => node.nextFocus(),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: isHidden1
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isHidden1 = !isHidden1;
                                    });
                                  }),
                              isDense: true,
                              focusColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                              hintText: "Enter Password",
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
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: StatefulBuilder(
                            builder: (context, StateSetter setState) {
                          return TextFormField(
                            controller: _repassC,
                            obscureText: isHidden2,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: isHidden1
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isHidden2 = !isHidden2;
                                    });
                                  }),
                              isDense: true,
                              focusColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                              hintText: "Retype Password",
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
                          );
                        }),
                      ),
                      CustomElevatedButton(
                          label: "Register",
                          onTap: () {
                            Get.find<AuthController>().signup(
                                _emailC.text,
                                _passC.text,
                                userType,
                                _nameC.text,
                                _phoneC.text);
                          }),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return Checkbox(
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
                              );
                            },
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
                                    builder: (_) => LoginPage(userType)),
                              );
                            },
                            child: Text(
                              "Click here",
                              style:
                                  ftt(context).bodyText1.copyWith(color: kPink),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
