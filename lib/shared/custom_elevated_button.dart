import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String label;
  const CustomElevatedButton({
    Key key,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        // onPrimary: Colors.transparent,
        // onSurface: Colors.transparent,
        primary: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

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
          constraints: BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
