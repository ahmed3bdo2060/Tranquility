import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';

class ProfileGededView extends StatefulWidget {
  const ProfileGededView({super.key});

  @override
  State<ProfileGededView> createState() => _ProfileGededViewState();
}
class _ProfileGededViewState extends State<ProfileGededView> {
  final list = [
    "https://th.bing.com/th/id/OIP.iSu2RcCcdm78xbxNDJMJSgHaEo?w=266&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.hF8_3tDhRrZvxm-j1kZwgwHaE9?w=248&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.GPFEY6kfgxbsja6gmrW6rwHaE7?w=249&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.rFwsyhDU3Ds1igWydqPpeQHaEo?w=267&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.yOoOlRkcBZmpRfP3AlPD4QHaEo?w=267&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.yOoOlRkcBZmpRfP3AlPD4QHaEo?w=267&h=180&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.NoyfVtF3xVt2UiLi6Umz0AHaFC?w=263&h=181&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.NoyfVtF3xVt2UiLi6Umz0AHaFC?w=263&h=181&c=7&r=0&o=5&pid=1.7",
    "https://th.bing.com/th/id/OIP.xzTRZHJAnfIuz8qX2Z1mkQHaEo?w=313&h=195&c=7&r=0&o=5&pid=1.7",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 24),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://th.bing.com/th/id/OIP.jjCTxA3s6gTKeDMvW4nfMQHaFj?rs=1&pid=ImgDetMain")
                    ),
                    borderRadius: BorderRadius.circular(75),
                    border: GradientBoxBorder(
                      width: 2,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffCB1EC4),
                          Color(0xff4813DE)
                        ]
                      ),
                    ),
                  ),
                  // child:ClipRRect(
                  //     borderRadius: BorderRadius.circular(75),
                  //     child:AppImage(fit: BoxFit.cover,"https://imgv3.fotor.com/images/gallery/cartoon-character-generated-by-Fotor-ai-art-creator.jpg")),
                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:[ Text("Jessica Johannce",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ),),
                  SizedBox(width: 5,),
                  AppImage("assets/svg/checkvalue.svg")
              ]),
              SizedBox(height: 8,),
              Text("Art photographer and freelancer \n Want to collaborate? Send me a message",
              textAlign: TextAlign.center,),
              SizedBox(height: 24,),
              Row(
                children: [
                Expanded(
                  child: Container(
                    height: 32,
                    margin: EdgeInsets.only(left: 16),
                    child: FilledButton(onPressed: (){}, child: Text("follow"),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xff00A3FF),
                       shape: RoundedRectangleBorder()
                    )),
                  ),
                ),
                SizedBox(width: 8,),
                  Expanded(
                    child: Container( 
                      height: 32,
                      margin: EdgeInsets.only(right: 16),
                      child: FilledButton(onPressed: (){}, child: Text("Message",
                      style: TextStyle(
                        color: Colors.black
                      )),
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(),
                            side: BorderSide(color: Color(0xffBABABA))
                          )),
                    ),
                  ),
              ],),
              SizedBox(height: 13,),
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 143.33/136.67,
                ), itemBuilder: (context, index) => Container(
                  child: AppImage(list[index],fit: BoxFit.cover),
                ) ,itemCount: list.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
