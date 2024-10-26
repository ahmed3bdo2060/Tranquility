
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget{
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 430,
            height: 466,
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
            child: Image.asset("assets/images/on_board.png"),
          ),
          const SizedBox(height: 16,),
          const Text("احجز فندقك بسهولة",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24),
          ),
          const SizedBox(height: 16,),
          const Text("اطلالات ساحرة لفصل الصيف",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal
          ),
          ),
          const SizedBox(height: 36,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: const Color(0xff00147C),
                    borderRadius: BorderRadius.circular(16)),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(16)),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
          const SizedBox(height: 60,),
          FilledButton(onPressed: (){},
            style: FilledButton.styleFrom(
                backgroundColor: const Color(0xff00147C),
                fixedSize: const Size(382, 50)),
              child: const Text("متابعة",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
              fontSize: 18),),),
          const SizedBox(height: 16,),
          OutlinedButton(onPressed: (){},
            style: OutlinedButton.styleFrom(
                fixedSize: const Size(382, 50),), child: const Text("تخطي",
          style: TextStyle(fontSize: 18,
          fontWeight: FontWeight.w600),
          ),)
        ],
      ),
    );
  }

}