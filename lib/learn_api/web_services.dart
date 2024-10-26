import 'package:dio/dio.dart';
import 'package:projects/learn_api/user.dart';
import 'package:retrofit/http.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices{
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;
  @GET('users')
  Future <List<User>> getAllUsers();
}
