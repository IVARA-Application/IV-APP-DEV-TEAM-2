import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/lib.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomIconButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 25,
      iconSize: 30.0,
      icon: GlowIcon(
        FontAwesomeIcons.chevronCircleLeft,
        color: kLightYellow,
      ),
      onPressed: () {},
    );
  }
}
