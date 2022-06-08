import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';
import 'package:teleheal_app/config/size_config.dart';

Widget dialogWaiting(BuildContext context) {
  SizeConfig().init(context);
  return Dialog(
    child: SizedBox(
        height: 200,
        width: SizeConfig.screenWidth,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(colorWhite),
          ),
        )),
  );
}
