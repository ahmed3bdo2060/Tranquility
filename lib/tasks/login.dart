

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 131,),
          Container(
            margin: const EdgeInsets.only(left: 65,right: 65),
            child: const Image(
              image: AssetImage("assets/images/WhatsApp_Imag.png"),
              height: 300,
              width: 300,)
        ),
          const SizedBox(height: 24,),
          const Text("AHMED",
            style: TextStyle(
                color: Color(0xff284243),
                fontWeight: FontWeight.w900,
                letterSpacing: 10,
            fontSize: 30),
          ),
          const SizedBox(height: 47,),
          const Text("Face ID is a facial Recognition feature which detects ",
              textAlign: TextAlign.center),const Text("person from his face expressions to know if he has ",
          textAlign: TextAlign.center,),
          const Text("Psychiatric illness or not ",
          textAlign: TextAlign.center,),
          const SizedBox(height: 66,),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                color: Color(0xff284243),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 60,
            width: 382,
            child: const Text("Get Started", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

}