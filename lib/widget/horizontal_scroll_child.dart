import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalScrollChild extends StatelessWidget {
  final double width;
  final Function callback;
  const HorizontalScrollChild({Key key, this.width, this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: callback,
        child: Container(
          height: double.infinity,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/banner-dummy.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(5, 5),
                    color: Colors.black.withOpacity(0.25))
              ]),
        ),
      ),
    );
  }
}
