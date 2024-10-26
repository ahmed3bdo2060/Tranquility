import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/setting_model.dart';

import '../../../../core/logic/app_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final list=[
    SettingModel("Contact Us", "assets/images/call.png"),
    SettingModel("Email Us", "assets/images/email.png"),
    SettingModel("Visit Our Website", "assets/images/url.png")
     ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 44),
          child: ListView.separated(itemBuilder: (context, index) => Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(list[index].text),
                    IconButton(onPressed: (){
                    },
                        icon: AppImage(list[index].image,width: 32,hieght: 32,))
                  ],
                )
            ),
          ), separatorBuilder: (context, index) => SizedBox(height: 24), itemCount:list.length),
        ),
      ),
    );
  }
}
