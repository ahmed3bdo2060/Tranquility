import 'package:flutter/material.dart';

class SelectUserView extends StatelessWidget {
  const SelectUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_outlined),
        title: const Text("Select User Type"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(color: Color(0xff284243)),
            height: 200,
            width: 200,
            child: const Image(image: AssetImage("assets/images/Vector.png")),
          ),
          const SizedBox(
            height: 62,
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
            height: 200,
            width: 200,
            child: const Image(image: AssetImage("assets/images/Group 3.png")),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                color: Color(0xff284243),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            height: 60,
            width: 382,
            child: const Text("Next", style: TextStyle(color: Colors.white)),
          )
        ]),
      ),
    );
  }
}
