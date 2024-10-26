import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:projects/core/api/api_consumer.dart';
import 'package:projects/core/api/end_point.dart';
import 'package:projects/core/errors/exceptions.dart';
import 'package:projects/login/events.dart';
import 'package:projects/login/model.dart';
import 'package:projects/login/states.dart';
import 'package:projects/views/tranquility/onboard1.dart';

class LoginsBloc extends Bloc<LoginEvents,LoginStates>{
  LoginsBloc(this.api):super(LoginStates());
  final ApiConsumer api;
  SignInModel? user;


  Future<void> send(String userName,var pass) async{
    try {
      emit(LoadingLoginState());
      final response = await api.post(
          EndPoint.login, data: {ApiKey.email: userName, ApiKey.password: pass});
      user = SignInModel.fromJson(response);
     final decodedToken = JwtDecoder.tryDecode(user!.token);
     print("tokenId ${decodedToken?["id"]}");
      emit(SendLoginSuccessState());
    }on ServerException catch(e){
      emit(SendLoginFailedState(msg: e.errorsModel.errorMessage));
    }
  }
}