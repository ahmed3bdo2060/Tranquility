import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projects/learn_api/cubit.dart';
import 'package:projects/learn_api/my_repo.dart';
import 'package:projects/learn_api/web_services.dart';

final getIt = GetIt.instance;
void initGetIt(){
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<WebServices>(() => WebServices(Dio()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
}