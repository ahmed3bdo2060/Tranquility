import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';

enum ImageCornersType {
  start,
  end,
  both
}

class AppOnboard extends StatelessWidget {
  const AppOnboard(
      {super.key, required this.image,
        required this.headLine,
        required this.description,
        required this.curveType,});

  final String image, headLine, description;

  final ImageCornersType curveType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: _border(),
            child: AppImage(image)),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(headLine, style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
          )),
        ),
        Text(description, style: const TextStyle(
            fontSize: 22
        ),)
      ],
    );
  }
  BorderRadiusDirectional _border(){
   if(curveType==ImageCornersType.start){
     return const BorderRadiusDirectional.only(bottomStart: Radius.circular(30));
   } else if(curveType==ImageCornersType.end){
     return const BorderRadiusDirectional.only(bottomEnd: Radius.circular(30));
   }
   return const BorderRadiusDirectional.only(bottomEnd: Radius.circular(30),bottomStart: Radius.circular(30));
  }
}
