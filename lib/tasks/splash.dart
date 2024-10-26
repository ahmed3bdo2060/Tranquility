
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:projects/tasks/home.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
           onPressed: () {
             runApp(MaterialApp(
                 debugShowCheckedModeBanner: false,
                 home: HomeView(),
               ),
             );
           },icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff05A59B),
              Color(0xff000000),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd
          )
        ),
        child:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Bounce(
                duration: const Duration(seconds: 4),
                child: const Image(
                    image: AssetImage("assets/images/logo.png")
                ),
              ),
              const Text("Music",style: TextStyle(
                  fontWeight: FontWeight.w900,
              fontSize: 50,
                  fontFamily: "Joti",
              color: Colors.white,
                  letterSpacing: 10),)
            ],
          ),
        ),
      ),
    );
      // Scaffold(
      //   body: Container(
      //     decoration: const BoxDecoration(
      //         gradient: LinearGradient(colors:[
      //           Color(0xff05A59B),
      //             Color(0xff000000)
      //         ],
      //          begin: AlignmentDirectional.topStart,
      //         end: AlignmentDirectional.bottomEnd
      //         )),
      //     child: Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           ShakeY(
      //             duration:const Duration(seconds: 3),
      //               child: Image.asset("assets/images/logo.png",)),
      //           const SizedBox(height: 8),
      //           const Text("Music",
      //             style:TextStyle(fontSize: 50,fontFamily: "Joti",
      //             color: Color(0xffFFFFFF),fontWeight: FontWeight.w900,) ,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // );
  }

}