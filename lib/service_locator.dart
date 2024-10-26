import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projects/core/api/dio_consumer.dart';
import 'package:projects/core/dio_helper.dart';
import 'login/bloc.dart';
import 'products/cart/bloc.dart';
import 'products/category/bloc.dart';
import 'products/contactus/bloc.dart';
import 'products/login/bloc.dart';
import 'products/product/bloc.dart';
import 'products/slider/bloc.dart';
import 'products/update_cart/bloc.dart';

void initServiceLocator(){
  final container = GetIt.instance;
  container.registerSingleton(DioHelper());
  container.registerFactory(() => SliderBloc(container<DioHelper>())..add(SliderEvent())..timer());
  container.registerFactory(() => LoginBloc(container<DioHelper>()));
  container.registerFactory(() => LoginsBloc(DioConsumer(dio: Dio())));
  container.registerFactory(() => CategoriesBloc(container<DioHelper>())..add(CategoriesEvent()));
  container.registerFactory(() => ProductBloc(container<DioHelper>())..add(ProductEvent()));
  container.registerFactory(() => ContactUsBloc(container<DioHelper>()));
  container.registerFactory(() => UpdateCartBloc(container<DioHelper>()));
  container.registerFactory(() => CartBloc(container<DioHelper>())..add(GetCartEvent()));
}