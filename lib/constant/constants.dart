import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/colours.dart';

const BoxDecoration kBGdecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.25, 0.75, 1.0],
    colors: [
      Color(0xFF8569C5),
      Color(0xFFC579B5),
      Color(0xFFF48380),
      Color(0xFFF3d37B),
    ],
  ),
);

const BoxDecoration kPBGdecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // stops: [0.0, 0.25, 0.75, 1.0],
    colors: [kPurple, kLightRed],
  ),
);

TextTheme ftt(BuildContext c) {
  return Theme.of(c).textTheme;
}

ShapeBorder kCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
);
