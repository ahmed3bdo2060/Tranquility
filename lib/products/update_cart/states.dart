part of 'bloc.dart';
class UpdateCartItemStates{}
class UpdateCartItemLoadingState extends UpdateCartItemStates{}
class UpdateCartItemFailedState extends UpdateCartItemStates{
  final String msg;

  UpdateCartItemFailedState({required this.msg});
}
class UpdateCartItemSuccessState extends UpdateCartItemStates{
  final int id;
  final bool isAdd;

  UpdateCartItemSuccessState({required this.id,required this.isAdd});
}
