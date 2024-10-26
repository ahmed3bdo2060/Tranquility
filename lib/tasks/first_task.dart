import 'package:flutter/material.dart';

class Task1View extends StatelessWidget{
  const Task1View({super.key});
  @override
  Widget build(BuildContext context) {
     return Scaffold(
           body: SafeArea(
             child: Container(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Container(
                     height: 100,
                      width: 100,
                     decoration: BoxDecoration(color: Color(0xffC90808),borderRadius: BorderRadius.circular(16)),
                   ),
                   SizedBox(height: 10),
                   Container(
                     height: 100,
                     width: 100,
                     decoration: BoxDecoration(color: Color(0xffD7E629),borderRadius: BorderRadius.circular(16)),
                   ),
                   SizedBox(height: 10,),
                   Container(
                     height: 100,
                     width: 100,
                     decoration: BoxDecoration(color: Color(0xff000000),borderRadius: BorderRadius.circular(16)),
                   )
                 ],
               ),
             ),
           ),
         );
  }

}