import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/core/logic/validator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions",
        style: TextStyle(
            fontWeight: FontWeight.w700,
          fontSize: 24
        )),
      ),
      body:SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              AppImage("assets/images/Suggest.png",hieght: 170,width: 170),
              SizedBox(height: 16,),
              Text("Tell Us How We Can Help",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24
              ),),
              SizedBox(height: 20,),
              AppInput(label: "Subject",
                validate: (value) => InputValidator.validatorNormalInput(value,"subject"),
                hint: "Subject",
                isPassword: false,
                keyboardType: TextInputType.text,),
              SizedBox(height: 16,),
              AppInput(
                validate: (value) => InputValidator.validatorNormalInput(value,"body"),
                label: "body",
                hint: "body",
                isMultiLines: true,
              ),
              SizedBox(height: 12,),
              AppButton(text: "Send Message", onPressd: (){
                if(formKey.currentState!.validate()){
                  print("valid");
                }else{
                  print("unvalid");
                }
              }),
              SizedBox(height: 20,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Our Social Media Pages",
                     style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 16
                     ),),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       IconButton(onPressed: ()async{
                         await openUrl("https://www.facebook.com/A7MED.3BDELAAL94");
                       },
                           icon: AppImage("assets/images/Facebook.png",
                             hieght: 32,
                             width: 32,)),
                       SizedBox(width: 32,),
                       IconButton(onPressed: (){
                         openUrl("https://www.instagram.com/a7med.3bdelaal94/");
                       },
                           icon: AppImage("assets/images/Instagram.png",
                             hieght: 32,
                             width: 32,)),
                       SizedBox(width: 32,),
                       IconButton(onPressed: (){
                         openUrl("https://www.linkedin.com/in/ahmed-abdo-9bb4a129b/");
                       },
                           icon: AppImage("assets/images/Linkedin.png",
                             hieght: 32,
                             width: 32,))
                     ],
                   ),
                   SizedBox(height: 20,),
                   Text("Our Social Media Pages",
                     style: TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 16
                     ),),
                   SizedBox(height: 20,),
                   IconButton(onPressed: (){
                     openUrl("https://amit-learning.com/");
                   },
                       icon: AppImage("assets/images/World wide web.png",
                         hieght: 32,
                       width: 32,))
                 ],
               )
              //
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 60,
          height: 60,
          child: IconButton(onPressed: (){
            openUrl("mailto:anaa7med8360@gmail.com?subject=Hi&body=How are you");
          },
              icon: AppImage("assets/images/Gmail.png",width: 32,hieght: 32,)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xffFF6179).withOpacity(.50)
          ),),
          SizedBox(height: 8,),
          Container(width: 60,
            height: 60,
            child: IconButton(onPressed: (){
              openUrl("sms:5550101234");
            },
                icon: AppImage("assets/images/Whatsapp.png",width: 32,hieght: 32,)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0xff56CF62).withOpacity(.50)
            ),),SizedBox(height: 8,),
          IconButton(onPressed: (){
            openUrl("tel:+20-012-120-402-81");
          },
              icon: AppImage("https://th.bing.com/th/id/OIP.0An67X0LReMM53142JoKeAAAAA?rs=1&pid=ImgDetMain",
                width: 60,hieght: 60,)),

        ],
      ),
    );
  }
}
