import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/core/api/end_point.dart';
import '../../core/dio_helper.dart';
import '../../core/errors/exceptions.dart';
part 'states.dart';
part 'model.dart';
part 'events.dart';
class CategoriesBloc extends Bloc<CategoriesEvents,CategoriesStates>{
  // late List<CategoryModel> list;
  // late CustomResponse response;
  CategoriesBloc(this._dio) : super(CategoriesLoadingState()){
    on<CategoriesEvent>(_getData);
  }
  final DioHelper _dio;

  Future<void> _getData(CategoriesEvent event, Emitter<CategoriesStates> emit)async {
    try {
      emit(CategoriesLoadingState());
      final response = await _dio.get(EndPoint.categories);
      final list = CategoryData.fromJson(response.data).list;
      emit(CategoriesSuccessfulState(list: list));
    }on ServerException catch(e){
      emit(CategoriesFailedState(msg: e.errorsModel.errorMessage));
    }
  }
}