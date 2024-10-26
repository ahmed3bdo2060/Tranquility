import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/learn_api/states.dart';

import 'my_repo.dart';

class MyCubit extends Cubit<MyStates>{
  final MyRepo myRepo;
  MyCubit(this.myRepo):super(IntialState());
  void emitGetAllUsers(){
    myRepo.getAllUsers().then((value) {
      emit(GetAllUsersState(allUsersList: value));
    });
  }

}