
import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget{
  const ColumnView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 295.72,
            width: 430,
            color: Color(0xff3AD912),
          ),
          Container(
            height: 68.19,
            width: 430,
            color: Color(0xffC01010),
          ),
          Container(
            height: 68.19,
            width: 370.58,
            color: Color(0xff1041C0),
          ),
          Container(
            height: 74.12,
            width: 74.12,
            color: Color(0xffA00000),
          ),
          Container(
            height: 65.22,
            child: Text("AHMED",
            style: TextStyle(fontSize: 53.36,fontWeight: FontWeight.w600)),
          ),
          Container(
            height: 68.19,
            width: 398,
            color: Color(0xff1041C0),
          )
        ],
      ),
    );
  }

}