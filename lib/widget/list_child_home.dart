import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teleheal_app/config/const.dart';

class ListChildHome extends StatelessWidget {
  final String text;
  final String alamat;
  final String id;
  final Function callbackDetail;

  const ListChildHome(
      {Key key, this.text, this.alamat, this.id, this.callbackDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 7),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
            child: Image.asset(
              'asset/images/logo-comp.jpg',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
          width10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                height5,
                Text(
                  alamat,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 13),
                ),
              ],
            ),
          ),
          width10,
          InkWell(
            onTap: callbackDetail,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Lihat Detail",
                style: TextStyle(fontSize: 12, color: colorPrimary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
