import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}
int currendIndex=0;

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currendIndex,
          onTap: (value) {
            currendIndex = value;
            setState(() {

            });
          },
          unselectedItemColor: Color(0xffAAA9A9),
          selectedItemColor: Color(0xffFFFFFF),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/chat.svg",
                    color: const Color(0xffAAA9A9)),
                activeIcon: SvgPicture.asset("assets/svg/chat.svg",
                    color: const Color(0xffFFFFFF)),
                label: "Chat"
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/quotes.svg",
                    color: const Color(0xffAAA9A9)),
                activeIcon: SvgPicture.asset("assets/svg/quotes.svg",
                    color: const Color(0xffFFFFFF)),
                label: "Quotes"
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/profile.svg",
                    color: const Color(0xffAAA9A9)),
                activeIcon: SvgPicture.asset("assets/svg/profile.svg",
                    color: const Color(0xffFFFFFF)),
                label: "Search"
            ),],backgroundColor: Color(0xff284243)),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Chat",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24
            )),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
           children: [
             Container(
               padding: const EdgeInsets.only(right: 23,left: 23),
               child: Row(
                 children: [
                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.black),
                       color: const Color(0xff284243).withOpacity(0.1),
                       borderRadius: BorderRadius.circular(9)
                     ),
                     width: 317,
                     height: 52,
                     child: const Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(width: 10,),
                         Text("About Work",),
                         SizedBox(width: 140,),
                         Text("10/12/2021")
                       ],
                     ),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,))
                 ],
               ),
             ),
             const SizedBox(height: 16,),
             Container(
               padding: const EdgeInsets.only(right: 23,left: 23),
               child: Row(
                 children: [
                   Container(
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.black),
                         color: const Color(0xff284243).withOpacity(0.1),
                         borderRadius: BorderRadius.circular(9)
                     ),
                     width: 317,
                     height: 52,
                     child: const Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(width: 10,),
                         Text("About My Family",),
                         SizedBox(width: 112,),
                         Text("10/12/2021")
                       ],
                     ),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,))
                 ],
               ),
             ),
             const SizedBox(height: 16,),
             Container(
               padding: const EdgeInsets.only(right: 23,left: 23),
               child: Row(
                 children: [
                   Container(
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.black),
                         color: const Color(0xff284243).withOpacity(0.1),
                         borderRadius: BorderRadius.circular(9)
                     ),
                     width: 317,
                     height: 52,
                     child: const Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         SizedBox(width: 10,),
                         Text("My self",),
                         SizedBox(width: 175,),
                         Text("10/12/2021")
                       ],
                     ),
                   ),
                   IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,))
                 ],
               ),
             )
           ],
        ),
      ),
      floatingActionButton: Column(
         mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: const Color(0xffF7715B),
            shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Image.asset("assets/images/chatface.png",
                  height: 24.64,
                  width: 24.64,)),
          ),
          const SizedBox(height: 16,),
          FloatingActionButton(
            onPressed: (){},
            backgroundColor: const Color(0xff284243),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Image.asset("assets/images/message.png",
            width: 24.64,
            height: 24.64),
          ),
        ],
      ),
    );
  }
}
