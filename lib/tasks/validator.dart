import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_input.dart';

import '../core/logic/validator.dart';

class ValidatorView extends StatefulWidget {
  const ValidatorView({super.key});
  @override
  State<ValidatorView> createState() => _ValidatorViewState();
}
final formKey = GlobalKey<FormState>();
final textController = TextEditingController();
class _ValidatorViewState extends State<ValidatorView> {
  bool specialCharacter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validator"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            AppInput(
              controller: textController,
              keyboardType: TextInputType.text,
              validate: InputValidator.myVal,
            ),
            SizedBox(height: 16,),
            AppButton(text: "log in", onPressd: (){}),
            CheckboxListTile(title: Text("Password must contain at least Special character"),
                value: false,
                onChanged: (value) {
              if(textController.text.isEmpty){
                value=true;
              }
              setState(() {

              });
                },)
          ],
        ),
      ),
    );
  }
}
