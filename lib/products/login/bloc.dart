import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/core/api/end_point.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/products/login/events.dart';
import 'package:projects/products/login/states.dart';
import 'package:projects/products/products.dart';

import '../../core/dio_helper.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  final DioHelper _dio;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc(this._dio) : super(LoginStates()){
    on<SendLoginEvent>(_send);
  }

  Future<void> send(context)async{

    try {
      emit(LoginLoadingState());
     await _dio.send("login", data: {
        "phone": phoneController.text,
        "password": passwordController.text,
        "device_token": "test",
        "type": Platform.operatingSystem,
        "user_type": "client",
      });
      emit(LoginSuccessfulState());
    }on LoginException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!)));
      emit(LoginFailedState());
    }on NetworkException catch(_){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Check your connection")));
      emit(LoginFailedState());
    }
  }

  FutureOr<void> _send(SendLoginEvent event, Emitter<LoginStates> emit) {
  }

}