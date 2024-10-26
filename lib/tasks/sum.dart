import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SumView extends StatefulWidget {
  const SumView({super.key});

  @override
  State<SumView> createState() => _SumViewState();
}
int currentIndex=0;
final textNumber1Controller = TextEditingController();
final textNumber2Controller = TextEditingController();
int? result;

class _SumViewState extends State<SumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        onTap: (value) {
          currentIndex=value;
          setState(() {

          });
        },
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/time.svg",color: Colors.red,),
            activeIcon: SvgPicture.asset("assets/svg/time.svg",color: Colors.white,),
            label: "Time"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/message.svg",color: Colors.red,),
            activeIcon: SvgPicture.asset("assets/svg/message.svg",color: Colors.white,),
            label: "Message"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/comment.svg",color: Colors.red,),
            activeIcon: SvgPicture.asset("assets/svg/comment.svg",color: Colors.white,),
            label: "Comment"
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                keyboardType: TextInputType.number,
                controller: textNumber1Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 3,
                        color: Colors.black
                    )
                  )
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                autofocus: true,
                controller: textNumber2Controller,
                keyboardType: TextInputType.number,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 3,
                            color: Colors.black
                        ))
                ),
              ),
              const SizedBox(height: 20,),
              OutlinedButton(onPressed: (){
                int number1 = int.tryParse(textNumber1Controller.text)??0;
                int number2 = int.tryParse(textNumber2Controller.text)??0;
                result = number1+number2;
                setState(() {

                });
              },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 50),
                side: const BorderSide(color: Colors.black,
                width: 3),
              ), child: const Text("Sum"),),
              const SizedBox(height: 20,),
              if(result!=null)
              Text("result = $result",style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
