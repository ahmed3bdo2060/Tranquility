import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects/learn_api/cubit.dart';
import 'package:projects/learn_api/states.dart';
import 'package:projects/learn_api/user.dart';

class LearnApiView extends StatefulWidget {
  const LearnApiView({super.key});

  @override
  State<LearnApiView> createState() => _LearnApiViewState();
}

class _LearnApiViewState extends State<LearnApiView> {
  List<User> usersList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<MyCubit,MyStates>(builder: (context, state) {
              if(state is GetAllUsersState){
                usersList = state.allUsersList;
                return ListView.builder(itemBuilder: (context, index) {
                  return Container(
                  height: 50,
                  child: Center(child: Text(usersList[index].name.toString())));
                });
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },)
          ],
        ),
      ),
    );
  }
}
