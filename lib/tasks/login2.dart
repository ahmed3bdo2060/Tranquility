import 'package:flutter/material.dart';

class LoginView2 extends StatelessWidget {
  const LoginView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(
      body: ListView(
        padding:  const EdgeInsets.only(right: 16,left: 16),
        children: [
          const SizedBox(height: 80,),
           Center(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(25),
               child: Image.asset("assets/images/login.png",
                 height: 240,
               width: 250,
               fit: BoxFit.cover,),
             ),
           ),
          const SizedBox(height: 44,),
          TextFormField(
            decoration: InputDecoration(
              hintText: "ادخل البريد الالكترونى",
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
              floatingLabelStyle: const TextStyle(
                color: Color(0xff0F006D),
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
              labelText: "البريد الإلكتروني ",
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                 gapPadding: 16,
                borderSide: const BorderSide(
                  color: Color(0xff0F006D),
                    width: 2,)
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xff0F006D)
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff0F006D),
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
          const SizedBox(height: 22,),
          TextFormField(
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                  color: Color(0xff0F006D) 
              ),
                hintText: "ادخل كلمة المرور",
                hintStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
                labelText: "كلمة المرور ",
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff0F006D),
                      width: 2,)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xff0F006D)
                  )
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color(0xff0F006D),
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 42,),
          FilledButton(onPressed: (){},
            style: FilledButton.styleFrom(
              shape:  RoundedRectangleBorder( 
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: const Size.fromHeight(60),
              backgroundColor: const Color(0xff0F006D)
            ), child: const Text("تسجيل الدخول",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          )),)
        ],
      ),
    ),
    );
  }
}
