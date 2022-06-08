import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key key,
    @required this.width,
    @required this.title,
    this.onClick,
    this.bgColor = colorPrimary,
    this.textColor = colorWhite,
    this.loading = false,
  }) : super(key: key);

  final double width;
  final Function onClick;
  final String title;
  final Color bgColor, textColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(6.0),
        primary: bgColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      child: AnimatedContainer(
        width: loading ? width : width,
        height: size.width < 400
            ? size.width * 0.09
            : size.width > 660
                ? size.width * 0.05
                : size.width * 0.08,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    backgroundColor: bgColor,
                    valueColor: AlwaysStoppedAnimation(textColor),
                  )
                : Text(
                    title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor),
                  )),
      ),
    );
  }
}
