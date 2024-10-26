import 'package:projects/core/api/end_point.dart';

class SignInModel{
  SignInModel({
    required this.message,
    required this.token,
  });
  late final String message;
  late final String token;

 factory SignInModel.fromJson(Map<String, dynamic> json){
   return SignInModel(message: ApiKey.message, token: ApiKey.token);
 }
}