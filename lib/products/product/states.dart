import 'package:projects/core/dio_helper.dart';

import 'model.dart';

class ProductStates{}
class ProductLoadingState extends ProductStates{}
class ProductFailedState extends ProductStates{
  final String msg;

  ProductFailedState({required this.msg});
}
class ProductSuccessfulState extends ProductStates{
  final ProductData model;

  ProductSuccessfulState({required this.model});
}