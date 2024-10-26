import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/login/bloc.dart';
import 'package:projects/login/pass_validator.dart';
import 'package:projects/login/states.dart';
import 'package:projects/login/user_validator.dart';

class LoginTaskView extends StatefulWidget {
  const LoginTaskView({super.key});

  @override
  State<LoginTaskView> createState() => _LoginTaskViewState();
}

class _LoginTaskViewState extends State<LoginTaskView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final bloc = GetIt.I<LoginsBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppImage("https://static.vecteezy.com/system/resources/previews/002/437/945/large_2x/illustration-of-a-login-account-free-vector.jpg",
              width: double.infinity,),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.all(16).copyWith(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppInput(
                    validate: (value) => UserValidator.userName(userController.text),
                    controller: userController,
                    label: "UserName",
                  ),
                  SizedBox(height: 20,),
                  AppInput(label: "Password",
                  validate: (value) => PassValidator.passWord(passwordController.text),
                  controller: passwordController),
                  SizedBox(height: 20,),
                  BlocConsumer<LoginsBloc,LoginStates>(
                    bloc: bloc,
                    listener: (context, state) {
                      if(state is SendLoginSuccessState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sucess"),backgroundColor: Colors.green,));
                      }else if (state is SendLoginFailedState){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed"),backgroundColor: Colors.red,));
                      }
                    },
                    builder: (context, state) {
                      return state is LoadingLoginState?Center(child: CircularProgressIndicator(),):AppButton(text: "Login", onPressd: () {
                        bloc.send(userController.text, passwordController.text);
                      },);
                    },

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
