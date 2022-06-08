import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {Key key,
      this.bgColor = colorPrimary,
      this.textColor = colorWhite,
      this.fontSize = 14,
      @required this.text,
      this.callback,
      this.borderRadius})
      : super(key: key);

  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final String text;
  final Function callback;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
          primary: textColor,
          backgroundColor: bgColor,
          textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              fontFamily: "Readex"),
        ),
        onPressed: callback,
        child: Text(
          text,
        ));
  }
}
