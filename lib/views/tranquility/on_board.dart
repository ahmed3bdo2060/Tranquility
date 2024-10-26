import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/onboard_design.dart';
import 'package:projects/core/logic/List_onboard.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:projects/views/tranquility/onboard1.dart';
import 'package:projects/views/tranquility/tran_login.dart';

import '../../core/logic/helper_methods.dart';

class Onboard2View extends StatefulWidget {
  const Onboard2View({super.key});

  @override
  State<Onboard2View> createState() => _Onboard2ViewState();
}

class _Onboard2ViewState extends State<Onboard2View> {
  int pageIndex=0;
  late Timer timer;
  @override
  void initState() {
    pageController=PageController(initialPage: 0);
    // timer=Timer.periodic(Duration(seconds: 2), (Timer timer) {
    //   if(pageIndex<onBoards.length-1){
    //     pageIndex++;
    //   }else{
    //     pageIndex=0;
    //   }
    //   pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    // });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    timer.cancel();
  }
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  pageIndex=value;
                  setState(() {

                  });
                },
                controller: pageController,
                itemCount: onBoards.length,
                itemBuilder: (context, index) =>
                    AppOnboard(image:onBoards[index].image,
                  curveType: index==0?ImageCornersType.start:index==onBoards.length-1?ImageCornersType.end:ImageCornersType.both,
                  headLine: onBoards[index].headLine,
                  description: onBoards[index].describtions),)),
          PageViewDotIndicator(currentItem: pageIndex,
            count: onBoards.length,
            unselectedColor: Colors.black,
            selectedColor: Colors.deepOrange,
            padding: EdgeInsets.only(bottom: 5),
            boxShape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                FloatingActionButton(
                  onPressed: (){
                    if(pageIndex<=onBoards.length){
                      pageIndex--;
                      pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                    }else{
                      navigateTo(const TranqLoginView(),keepHistory: false);
                      CashHelper.setIsFirstTime();
                    }
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                if(pageIndex!=onBoards.length)
                  TextButton(onPressed: (){
                    navigateTo(const TranqLoginView());
                    CashHelper.setIsFirstTime();
                  }, child: const Text("skip")),

                FloatingActionButton(
                  onPressed: (){
                    if(pageIndex<onBoards.length){
                      pageIndex++;
                      pageController.nextPage(duration: Duration(milliseconds: 350), curve: Curves.easeIn);
                    }else{
                      navigateTo(const TranqLoginView(),keepHistory: true);
                      CashHelper.setIsFirstTime();
                    }

                    // navigateTo(OnBoardView2(),keepHistory: false);
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ]),
        ],
      )
    );
  }
}
