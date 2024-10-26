import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class FunPage extends StatefulWidget {
  const FunPage({super.key});

  @override
  State<FunPage> createState() => _FunPageState();
}


late int count ;
    // prefs.getInt("count")??0;

class _FunPageState extends State<FunPage> {
  String? selectedImage;
  bool click=true;
  final gender =["male","female"];
  String? selectedItem="male" ;
  @override
  void initState() {
    // TODO: implement initState
    count = CashHelper.count??0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                count++;
                CashHelper.setCount(count);
                // CashHelper.Count;
                setState(() {

                });
              },
              child: FadeInDownBig(
                child: Container(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text("+",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 150,
                          fontWeight: FontWeight.w900
                        )),
                  ),
                   width: double.infinity,
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                      boxShadow:[
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 4),
                            blurRadius: 4
                        )
                      ] ,
                      color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(200),
                        bottomStart: Radius.circular(200))
                  ),
                ),
              ),
            ),
            Text("$count",style: TextStyle(
              fontWeight: FontWeight.w900,fontSize: 40
            ),),
            GestureDetector(
              onTap: () {
                count--;
                CashHelper.setCount(count);
                 // prefs.setInt("count", count);
                setState(() {

                });
              },
              child: FadeInUpBig(
                child: Container(
                  padding: EdgeInsets.only(top: 80),
                  child: Text("ـــ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontWeight: FontWeight.w900
                      )),
                  height: MediaQuery.of(context).size.height/2,
                  width: double.infinity,
                  decoration:BoxDecoration(
                    boxShadow:[
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 4),
                        blurRadius: 2
                      )
                    ] ,
                      color: Colors.black,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(200),
                          topStart: Radius.circular(200))
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  MaterialStateProperty<Color> getColor(Color color,Color colorPressed){
    final getColor=(Set<MaterialState>states){
      if(states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    };
    return MaterialStateProperty.resolveWith(getColor);
  }
}
