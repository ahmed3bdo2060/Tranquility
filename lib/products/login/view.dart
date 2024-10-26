

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/dio_helper.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/core/logic/validator.dart';
import 'package:projects/products/login/bloc.dart';
import 'package:projects/products/login/events.dart';
import 'package:projects/products/login/states.dart';
import 'package:projects/products/products.dart';
import 'package:projects/views/tranquility/forget_password.dart';
final formKey = GlobalKey<FormState>();

class ProductoginView extends StatefulWidget {
  const ProductoginView({super.key});

  @override
  State<ProductoginView> createState() => _ProductoginViewState();
}

class _ProductoginViewState extends State<ProductoginView> {
  final bloc = GetIt.I<LoginBloc>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[
                  AppImage("https://th.bing.com/th/id/OIP.ehKKjfC6uLbuR-yInZe3lQHaEj?rs=1&pid=ImgDetMain",
                      width:MediaQuery.of(context).size.width,fit: BoxFit.cover),
                  const Text("Welcome To",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ) ),
                  const SizedBox(height: 6,),
                  Text("Products",
                      style: TextStyle(
                          fontSize: 48,
                          fontFamily: "Mystery",
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor
                      )),
                  const SizedBox(height: 10,),
                  AppInput(
                    controller: bloc.phoneController,
                    validate: InputValidator.phone,
                    keyboardType: TextInputType.phone,
                    label: "Phone Number",
                  ),
                  const SizedBox(height: 16,),
                  AppInput(
                    controller: bloc.passwordController,
                    validate: InputValidator.password,
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
                  BlocBuilder(bloc: bloc,builder: (context, state) {
                    if(state is LoginLoadingState){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return AppButton(text: "log In",
                          onPressd: (){
                            bloc.send(context);
                          });
                    }
                  },),
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
