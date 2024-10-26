import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/views/tranquility/onboard1.dart';
import 'package:projects/views/tranquility/tran_login.dart';

import '../../main.dart';
import 'on_board.dart';

class SecondSplashView extends StatefulWidget {
  const SecondSplashView({super.key});

  @override
  State<SecondSplashView> createState() => _SecondSplashViewState();
}

class _SecondSplashViewState extends State<SecondSplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigateTo(CashHelper.isFirstTime?const Onboard2View():const TranqLoginView(),keepHistory: false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElasticInUp(
          child: CircleAvatar(
            radius: 180,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tranquility",style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 48,
                    fontFamily: "corgettie",
                    fontWeight: FontWeight.w400
                ),),
                Text("Together Towards Tranquility",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor.withOpacity(.57)
                ),)
              ],
            ),
          ),
        ),

        ),
    );
  }
}
