import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/core/dio_helper.dart';
import 'package:projects/products/product/model.dart';
import 'package:projects/products/product/states.dart';
part 'events.dart';

class ProductBloc extends Bloc<ProductEvents,ProductStates>{
  ProductBloc(this._dio):super (ProductLoadingState()){
    on<ProductEvent>(_getData);
  }
  final DioHelper _dio ;


  Future<void> _getData(ProductEvent event, Emitter<ProductStates> emit)async {
    emit(ProductLoadingState());
    final response = await _dio.get("products");
    if(response.isSuccess){
      final model = ProductData.fromjson(response.data);
      emit(ProductSuccessfulState(model: model));
    }else{
      emit(ProductFailedState(msg: response.msg!));
    }
  }
}