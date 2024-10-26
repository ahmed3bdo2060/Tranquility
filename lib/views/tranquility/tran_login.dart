

import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/core/logic/validator.dart';
import 'package:projects/views/tranquility/forget_password.dart';
import 'package:projects/views/tranquility/home/view.dart';
final formKey = GlobalKey<FormState>();

class TranqLoginView extends StatefulWidget {
  const TranqLoginView({super.key});
  @override
  State<TranqLoginView> createState() => _TranqLoginViewState();
}

class _TranqLoginViewState extends State<TranqLoginView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: SingleChildScrollView(
             padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  AppImage("assets/images/tranq_login.png", hieght: 160,width:MediaQuery.of(context).size.width,),
                  // Image.asset("assets/images/tranq_login121.png",
                  // height: 160),
                const Text("Welcome To",
                    style: TextStyle(
                      fontSize: 24,
                        fontWeight: FontWeight.w500
                    ) ),
                const SizedBox(height: 6,),
                Text("Tranquility",
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: "Mystery",
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor
                )),
                  const SizedBox(height: 10,),
                  const AppInput(
                    validate: InputValidator.phone,
                    keyboardType: TextInputType.phone,
                    label: "Phone Number",
                  ),
                  const SizedBox(height: 16,),
                  const AppInput(
                    label: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 15,),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(onPressed: (){
                     navigateTo(const ForgetPasswordView(),keepHistory: true);
                    }, child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),
                    )),
                  ),
                  const SizedBox(height: 18,),
                  AppButton(text: "Log In",
                      onPressd: (){
                    navigateTo(HomeViewNA());
                    if(formKey.currentState!.validate()){
                      print("valid");
                    }else{
                      print("not valid");
                    }
                      }),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account ?",
                      ),
                      TextButton(onPressed: (){}, child: const Text("Sign up",
                      ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
