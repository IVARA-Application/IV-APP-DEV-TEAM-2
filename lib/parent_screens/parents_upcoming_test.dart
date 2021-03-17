import 'package:flutter/material.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/shared/glow_circle_avatar.dart';

class ParentsUpcomingTests extends StatelessWidget {
  const ParentsUpcomingTests({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GlowCircleAvatar(
            onTap: () {},
            imageProvider: AssetImage('assets/icons/profile.jpg'),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),



       body: Container(
        decoration: kPBGdecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
          ],
        ),
      ),
    );
  }
}
