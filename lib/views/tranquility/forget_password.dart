import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/views/tranquility/verification.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child:  Container(
          padding: EdgeInsets.only(right: 24,left: 24),
          child: ListView(
            children: [
              AppImage("assets/images/forgetpassword.png"),
              SizedBox(height: 23.49,),
              SizedBox(child: Text("Forget Your Password",
              style: TextStyle(
                fontSize: 24
              )),
              width: 249,
              height: 35,),
              SizedBox(height: 33,),
              AppInput(
                label: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 33,),
              AppButton(text: "Foreget Password", onPressd: (){
                navigateTo(VerifyView(),keepHistory: true);
              })
            ],
          ),
        ),
      ),
    );
  }
}
