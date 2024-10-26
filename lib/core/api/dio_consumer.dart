import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projects/core/api/api_consumer.dart';
import 'package:projects/core/api/api_interceptors.dart';
import 'package:projects/core/api/end_point.dart';
import 'package:projects/core/errors/error_model.dart';
import 'package:projects/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;

  DioConsumer({required this.dio}){
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
          request: true,
        requestBody: true,
        requestHeader:true,
      responseHeader: true,
      responseBody: true
    ));
  }

  @override
  Future delete(String path, {dynamic data,bool isFormData = true, Map<String, dynamic>? queryParameters})async{
    try {
      final response = await dio.delete(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try {
      final response = await dio.get(path,data: data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  patch(String path, {dynamic data,bool isFormData = true, Map<String, dynamic>? queryParameters})async {
    try {
      final response = await dio.patch(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  post(String path, {dynamic data,bool isFormData = true, Map<String, dynamic>? queryParameters})async {
    try {
      final response = await dio.post(path,data:isFormData?FormData.fromMap(data): data,queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}