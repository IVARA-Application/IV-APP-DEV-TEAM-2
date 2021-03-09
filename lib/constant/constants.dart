import 'package:flutter/material.dart';

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

TextTheme ftt(BuildContext c) {
  return Theme.of(c).textTheme;
}
