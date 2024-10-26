import 'package:projects/learn_api/user.dart';

class MyStates{}
class IntialState extends MyStates{}
class GetAllUsersState extends MyStates{
  final List<User> allUsersList;

  GetAllUsersState({required this.allUsersList});
}