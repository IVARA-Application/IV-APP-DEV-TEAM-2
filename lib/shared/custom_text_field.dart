import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key key,
    @required TextEditingController textController,
    @required this.hintText,
  })  : textController = textController,
        super(key: key);

  final TextEditingController textController;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        focusColor: Colors.white,
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        hintText: hintText,
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
  }
}
