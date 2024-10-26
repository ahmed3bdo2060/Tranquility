import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';

class NewGridView extends StatefulWidget {
  const NewGridView({super.key});

  @override
  State<NewGridView> createState() => _NewGridViewState();
}


class _NewGridViewState extends State<NewGridView> {
  List list=["All","Science","UI","UX","Flutter"];
  final grideModel=[
  ModelGride(image:"https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://www.wikihow.com/images/9/90/What_type_of_person_are_you_quiz_pic.png",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://img.freepik.com/free-photo/handsome-caucasian-man-wearing-casual-clothes-glasses-with-happy-cool-smile-face-lucky-person_839833-12772.jpg",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",text: "Hello",name: "Ahmed abdo"),
  ModelGride(image:"https://img.freepik.com/free-photo/bearded-man-denim-shirt-round-glasses_273609-11426.jpg",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello",name: "Ahmed abdo" ),
  ModelGride(image:"https://www.shutterstock.com/image-photo/spanish-young-man-black-beard-260nw-1245036790.jpg",text: "Hello",name: "Ahmed abdo"),
  ];
  Color textColor =Colors.white;
  bool click=false;
  bool? isPrissed;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff333333),
     body:DefaultTabController(
       length: grideModel.length,
       child: Column(
         children: [
           SafeArea(child: Container(
             decoration: BoxDecoration(
                 color:  Color(0xff333333),
               boxShadow: [BoxShadow(
                 offset:Offset(0, 4),
                 blurRadius: 4,
                 color: Colors.black.withOpacity(.25)
               )]
             ),
             child: TabBar(
               isScrollable: true,
               tabAlignment: TabAlignment.start,
               padding: EdgeInsetsDirectional.only(start: 16,bottom: 22,top: 22),
               labelPadding: EdgeInsetsDirectional.symmetric(horizontal: 20),
               indicator: BoxDecoration(
                   borderRadius: BorderRadius.circular(100),
                 color: Colors.white
               ),
                 indicatorSize: TabBarIndicatorSize.tab,
                 unselectedLabelColor: Colors.white,
                 labelStyle: TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18
                 ),
                 unselectedLabelStyle: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: 18
                 ),
                 dividerHeight: 0,
                 tabs:
                  List.generate(list.length, (index) => Tab(text:list[index]),)
             ),
           ),
           ),
           Expanded(
             child: GridView.builder(padding:EdgeInsets.all(16),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
                 childAspectRatio: 195/270
             ),itemBuilder: (context, index) =>_Item(model: grideModel[index]),itemCount: grideModel.length),
           ),
         ],
       ),
     )
       ,
    );
  }
}
class ModelGride {
  late String image, text,name;
  ModelGride({required this.image,required this.text,required this.name}){

  }
}
class _Item extends StatelessWidget {
  const _Item({super.key, required this.model});
  final ModelGride model;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: ClipRRect(borderRadius: BorderRadius.circular(16),
                  child: AppImage(model.image,fit: BoxFit.cover)),
            ),
          ),
          SizedBox(height: 8,),
          Text(model.text.toUpperCase(),style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16
          )),
          Text(model.name,style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10
          )),
        ],
      ),
    );
  }
}


