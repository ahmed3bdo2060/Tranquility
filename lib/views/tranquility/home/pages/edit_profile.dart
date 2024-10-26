import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/views/tranquility/tran_login.dart';
import 'package:transparent_image/transparent_image.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? selectedImage;
  final sheetModel = [
    BottomSheetModel(text: "Camera", image: "assets/svg/camera.svg"),
    BottomSheetModel(text: "Gallery", image: "assets/svg/gallery.svg")
  ];
  @override
  String dropDownValue = "Male";
  final list=["male","female"];
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 60),
        children: [
          SizedBox(height: 40,),
           Center(
             child: Container(
               height: 160,
               width: 160,
               child: Center(
                 child: Stack(
                    alignment: AlignmentDirectional.center,
                   children:[Center(child: ClipOval(clipBehavior:Clip.antiAlias ,
                       child:selectedImage!=null?AppImage(selectedImage!.path,width: 160,hieght: 160,fit: BoxFit.cover,)
                           :AppImage("assets/images/profile .png",width: 160,hieght: 160,fit: BoxFit.cover,))),
                     Align(
                       alignment: AlignmentDirectional.bottomEnd,
                       child: GestureDetector(
                           onTap: () {
                             showModalBottomSheet(context: context,backgroundColor: Colors.white, builder: (context) => Padding(
                               padding: EdgeInsets.all(24).copyWith(top: 50),
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Pick Image From...",style: TextStyle(
                                     fontSize: 18,
                                     fontWeight: FontWeight.w600
                                   )),
                                   SizedBox(height: 29,),
                                   Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     GestureDetector(
                                       onTap: () => chooseImage(ImageSource.camera),
                                       child: Container(
                                         color: Colors.transparent,
                                         child: Column(
                                           children: [
                                             AppImage("assets/svg/camera.svg"),
                                             SizedBox(height: 4,),
                                             Text("Camera",style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w600
                                             )),
                                           ],
                                         ),
                                       ),
                                     ),
                                     SizedBox(width: 72,),
                                     GestureDetector(
                                       onTap: () => chooseImage(ImageSource.gallery),
                                       child: Container(
                                         color: Colors.transparent,
                                         child: Column(
                                           children: [
                                             AppImage("assets/svg/gallery.svg"),
                                             SizedBox(height: 4,),
                                             Text("Gallery",style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.w600
                                             ))
                                                                            ],
                                                                          ),
                                       ),
                                     )
                                 ],
                               ),
                               ]),
                             ));
                           },child: CircleAvatar(radius: 26,child:AppImage ("assets/images/edit.png",)
                       ),
                       ),
                     ),
                   ]),
               ),
             ),
           ),
          SizedBox(height: 15,),
          AppInput(
            isPassword: false,label: "Name",
          ),
          SizedBox(height: 16,),
          AppInput(
            label: "Phone",
            keyboardType: TextInputType.phone,
          ),
           SizedBox(height: 16,),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: AppInput(keyboardType: TextInputType.phone,label: "Age",)),
              Expanded(
                  child: DropdownButton<String>(
                value: dropDownValue,
                icon: AppImage("assets/svg/arrow_down.svg",color: Colors.black),
                onChanged: (value) {
                  dropDownValue=value!;
                  setState(() {

                  });
                },padding: EdgeInsets.symmetric(horizontal: 16),
                items: [
                  DropdownMenuItem(child: Text("Male",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  )),value: "Male",),
                  DropdownMenuItem(child: Text("Female",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  )),value: "Female",)
                ],
              )),
              ],
          ),
          SizedBox(height:16,),
          AppButton(text: "Save", onPressd: (){}),
          SizedBox(height: 16,),
          InkWell(
            onTap: () {
              print("print");
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change Password",
                    style:TextStyle(
                      fontWeight: FontWeight.w400,fontSize: 16
                    ) ,),
                  AppImage("assets/svg/change_pasword.svg",
                      color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      )
    );

  }
  void chooseImage(ImageSource sources)async {
    XFile? result = await ImagePicker().pickImage(source: sources);
    Navigator.pop(context);
    if (result != null) {
      selectedImage = result;
    }
    setState(() {

    });
   }
}
class BottomSheetModel{
final String text,image;

  BottomSheetModel({required this.text, required this.image});
}
