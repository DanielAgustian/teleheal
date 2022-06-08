import 'package:flutter/cupertino.dart';
import 'package:teleheal_app/config/const.dart';

class TabBarChild extends StatelessWidget {
  final String name;
  final bool active;

  const TabBarChild({Key key, this.name, this.active = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1,
              color: active ? colorPrimary : colorNeutral.withOpacity(0.7))),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 14,
            color: active ? colorPrimary : colorNeutral,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400),
      ),
    );
  }
}
