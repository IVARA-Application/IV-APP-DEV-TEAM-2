import 'package:flutter/material.dart';
import 'package:new_ivara_app/homepage.dart';
import 'lib.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UserType.id,
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
