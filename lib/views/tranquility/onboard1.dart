import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/core/logic/onboard_class.dart';
import 'package:projects/views/tranquility/tran_login.dart';



class OnBoardView1 extends StatefulWidget {
  const OnBoardView1({super.key});

  @override
  State<OnBoardView1> createState() => _OnBoardView1State();
}
int currentContext = 1;
List model = [
  Onboard(image:"assets/images/onboard1.png", headLine: "Feel Free",describtions: "because I'm the friendly chatbot here to assist you with anything you need."),
  Onboard(image: "assets/images/onboard2.png", headLine: "Ask For Anything", describtions: "I'm your friendly neighborhood chatbot ready to assist you with any questions or concerns."),
  Onboard(image: "assets/images/onboard3.png", headLine: "Your Secert is Save", describtions: "Our platform prioritizes your privacy and security"),
];
List healine = [
  "Feel Free",
  "Ask For Anything",
  "Your Secert is Save"
];
List desc = [
  "because I'm the friendly chatbot here to assist you with anything you need.",
  "I'm your friendly neighborhood chatbot ready to assist you with any questions or concerns.",
  "Our platform prioritizes your privacy and security"
];
class _OnBoardView1State extends State<OnBoardView1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius:currentContext==2?BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)):
              currentContext==1?BorderRadius.only(bottomLeft: Radius.circular(100)):currentContext==3?BorderRadius.only(bottomRight: Radius.circular(100)):BorderRadius.circular(100),
              child: ElasticIn(
                child: AppImage(model[currentContext-1].image,
                hieght: MediaQuery.of(context).size.height*.50,
                    width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 24,),
           Padding(padding: const EdgeInsets.symmetric(horizontal: 19),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(model[currentContext-1].headLine,style: const TextStyle(
                     fontSize: 32,
                     fontWeight: FontWeight.bold
                 ),
                 ),
                 const SizedBox(height: 24),
                 Text(model[currentContext-1].describtions,
                   style: const TextStyle(
                       fontSize: 22
                   ),
                 ),
                 const SizedBox(height: 80,),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween

                     ,
                     children:[
                       if(currentContext!=3)
                       TextButton(onPressed: (){
                       navigateTo(const TranqLoginView());
                     }, child: const Text("skip")),
                       Spacer(),
                       FloatingActionButton(
                         onPressed: (){
                           if(currentContext<3){
                             currentContext++;
                             setState(() {

                             });
                           }else{
                             navigateTo(const TranqLoginView(),keepHistory: false);
                           }

                           // navigateTo(OnBoardView2(),keepHistory: false);
                         },
                         child: const Icon(Icons.arrow_forward_ios),
                       ),
                     ])
               ],
             ),
           )
          ],
        ),
      ),

    );
  }
}
