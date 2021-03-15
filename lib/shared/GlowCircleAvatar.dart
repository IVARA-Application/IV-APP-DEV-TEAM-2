import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:new_ivara_app/constant/colours.dart';



class GlowCircleAvatar extends StatelessWidget {
  final VoidCallback onTap;
  final ImageProvider imageProvider;
  const GlowCircleAvatar({
    Key key,
    @required this.onTap,
    @required this.imageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      color: kLightYellow,
      shape: BoxShape.circle,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: kLightYellow,
          // radius: 20,
          foregroundImage: imageProvider,
          minRadius: 16,
          // child: Image.asset('assets/icons/profile.jpg'),
        ),
      ),
      width: 35,
      glowColor: kLightYellow,
      // borderRadius: BorderRadius.circular(20),
      blurRadius: 10,
      margin: EdgeInsets.only(right: 14),
    );
  }
}
