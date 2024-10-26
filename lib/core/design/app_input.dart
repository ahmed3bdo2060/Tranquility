import 'dart:ffi';

import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final String? label , hint;
  final bool isPassword;
  final bool isMultiLines;
  final bool alignHint;
  final TextEditingController? controller;
  final String? Function(String? value)? validate;
  final TextInputType? keyboardType;
  final FloatingLabelAlignment lableAlign;
  const AppInput({super.key,
    this.label,
    this.keyboardType,
    this.isPassword=false,
    this.hint,
    this.lableAlign=FloatingLabelAlignment.start,
    this.alignHint=true,
    this.isMultiLines=false,this.validate,this.controller,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}
class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden&&widget.isPassword,
      maxLines: widget.isMultiLines?3:1,
      keyboardType: widget.keyboardType,
      controller: widget.controller ,
      validator:widget.validate,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,

          alignLabelWithHint: widget.alignHint,
          floatingLabelAlignment: widget.lableAlign,
          suffixIcon: widget.isPassword?IconButton(
            icon: Icon(
                isHidden?Icons.visibility_off:Icons.visibility),
            onPressed: (){
              isHidden= !isHidden;
              setState(() {

              });
            },):null
      ),
    ) ;
  }
}
