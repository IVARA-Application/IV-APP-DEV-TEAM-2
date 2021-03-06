import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lib.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      initialRoute: UserType.id,
      routes: {
        UserType.id: (_) => UserType(),
        // HomePage.id: (context) => HomePage(),
      },
    );
  }
}
