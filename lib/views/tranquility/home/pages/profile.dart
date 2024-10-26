import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff284243).withOpacity(0.15)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   const SizedBox(height: 55,),
                  Center(
                      child: AppImage("assets/images/assistant.png")
                  ),
                  const Text("Hey!",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primary,
                      letterSpacing: 5
                    ),
                  ),
                  const Text("I’am your Personal Assistent",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                      color: Color(0xff284243)
                  ),)
                ],
              ),
            ),
            const SizedBox(height: 48,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Make New Chat",
                      style: TextStyle(
                          color: Color(0xff284243),
                          fontSize: 22,
                          fontWeight: FontWeight.w400
                      ),),
                  const SizedBox(height: 16,),
                     AppInput(
                      keyboardType: TextInputType.text,
                      isPassword: false,
                      label: "Title",
                       hint: "Enter The title of Chat",
                    ),
                  const SizedBox(height: 24,),
                  AppButton(text: "Start Chat", onPressd: (){})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
