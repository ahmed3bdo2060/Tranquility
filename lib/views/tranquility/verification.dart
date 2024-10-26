import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_otp.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child:  Container(
          padding: const EdgeInsets.only(right: 24,left: 24),
          child: ListView(
            children: [
              const AppImage("assets/images/verify.png"),
              const SizedBox(height: 23.49,),
              const Text("Verification",
                  style: TextStyle(
                      fontSize: 24,
                    fontWeight: FontWeight.bold
                  )),
              const SizedBox(height: 8,),
              Text("Please enter the code sent on your phone.",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor.withOpacity(.67)
              ),
              textAlign: TextAlign.start),
              const SizedBox(height: 33,),
              AppOtp(),
              const SizedBox(height: 33,),
              AppButton(text: "Verify", onPressd: (){})
            ],
          ),
        ),
      ),
    );
  }
}
