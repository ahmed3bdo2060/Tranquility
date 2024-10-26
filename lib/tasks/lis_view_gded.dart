import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projects/core/design/app_image.dart';

class ListViewGded extends StatefulWidget {
  const ListViewGded({super.key});

  @override
  State<ListViewGded> createState() => _ListViewGdedState();
}

class _ListViewGdedState extends State<ListViewGded>with SingleTickerProviderStateMixin
{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this,initialIndex: 1);
    super.initState();
  }
  final list=[
    "ahmed","abdo","mahmoud"
  ];
  final listView=[
    ModelGride(image:"https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://www.wikihow.com/images/9/90/What_type_of_person_are_you_quiz_pic.png",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://img.freepik.com/free-photo/handsome-caucasian-man-wearing-casual-clothes-glasses-with-happy-cool-smile-face-lucky-person_839833-12772.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",text: "Hello World",name: "Ahmed abdo"),
    ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://img.freepik.com/free-photo/bearded-man-denim-shirt-round-glasses_273609-11426.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://www.shutterstock.com/image-photo/spanish-young-man-black-beard-260nw-1245036790.jpg",text: "Hello World",name: "Ahmed abdo"),
    ModelGride(image:"https://t4.ftcdn.net/jpg/02/17/60/49/360_F_217604941_QT4oCeRSsLNhulQdIwf8IlRaW5uZc74t.jpg",text: "Hello World",name: "Ahmed abdo" ),
    ModelGride(image:"https://www.shutterstock.com/image-photo/spanish-young-man-black-beard-260nw-1245036790.jpg",text: "Hello World",name: "Ahmed abdo"),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xff333333),
         extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("WhatsApp",style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Color(0xff9EA2A6)
          )),
          actions: [Icon(Icons.search,color: Color(0xff9EA2A6))
            ,DropdownMenuItem(child: IconButton(
                icon: AppImage("assets/svg/dropdownmenu.svg"),
                onPressed: (){}),)],
        ),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.fill,
                 unselectedLabelColor: Color(0xff9EA2A6),
                labelColor: Color(0xff08B09E),
                labelPadding: EdgeInsetsDirectional.all(8),
                indicatorColor: Color(0xff08B09E),
                dividerHeight: 0,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                indicatorWeight:  4,
                tabs: [
                  Tab(icon: Icon(Icons.camera_alt_outlined)),
                  Tab(text: "Chats"),
                  Tab(text: "STATUS"),
                  Tab(text: "CALLS"),
                ],
              ),
              Expanded(
                child:ListView.separated(itemBuilder: (context, index) =>
                    _Item(model: listView[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 2),
                    itemCount: listView.length,padding: EdgeInsetsDirectional.all(16),)
              )
            ],
          ),
        ),
      ),
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
    return ListTile(
      leading: ClipOval(child: AppImage(model.image,width: 40,hieght: 40,fit: BoxFit.cover,)),
      title: Text(model.name,maxLines: 1,overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.white,fontSize: 10
              ,fontWeight: FontWeight.w500
          )),
      subtitle:Text(model.text,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(
          color:Color(0xff9EA2A6) ,fontSize: 10
          ,fontWeight: FontWeight.w500
      )),
      trailing:  Text("10/12/2021",style: TextStyle(
          color:Color(0xff9EA2A6) ,fontSize: 10
          ,fontWeight: FontWeight.w500
      )),
      onTap: () {

      },
      contentPadding: EdgeInsets.zero,
      dense: true,
      horizontalTitleGap: 10,
    );
  }
}
