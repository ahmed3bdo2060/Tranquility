import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/app_theme.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/core/logic/list_navigation_bar.dart';
import 'package:projects/views/tranquility/home/pages/chat2.dart';
import 'package:projects/views/tranquility/home/pages/drawer/about_page.dart';
import 'package:projects/views/tranquility/home/pages/drawer/suggestion.dart';
import 'package:projects/views/tranquility/home/pages/edit_profile.dart';
import 'package:projects/views/tranquility/home/pages/quotes.dart';
import 'package:projects/views/tranquility/home/pages/setting.dart';
import 'package:projects/views/tranquility/tran_login.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pages/profile.dart';

class HomeViewNA extends StatefulWidget {
  const HomeViewNA({super.key});

  @override
  State<HomeViewNA> createState() => _HomeViewNAState();
}
List<Widget> pages = [
  const ChatPage(),
  const QuotesPage(),
  const EditProfilePage(),
  const SettingPage(),
];
int currentIndex = 0;

class _HomeViewNAState extends State<HomeViewNA> {
  final listDrawer =[
    DrawerModel(text: "About Us", icon: "assets/svg/about_us.svg"),
    DrawerModel(text: "Rate Our App", icon: "assets/svg/rate.svg"),
    DrawerModel(text: "Suggestions", icon: "assets/svg/suggestion.svg"),
    DrawerModel(text: "Enable Easy Login", icon: "assets/svg/easy_login.svg"),
    DrawerModel(text: "Logout", icon: "assets/svg/log_out.svg"),
  ];
  List<String> titles = [
    "Chats",
    "Qoutes",
    "Profile",
    "Setting",
  ];
  bool switchValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: pages[currentIndex],
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[ Container(
            padding: EdgeInsetsDirectional.all(24),
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(25),bottomEnd: Radius.circular(25)),
              shape: BoxShape.rectangle,
            ),
            child: const Column(
              children: [
                SizedBox(height: 37,),
                ClipOval(
                  child: AppImage("https://th.bing.com/th/id/R.2fc6ecdf7989040501034d7005f2678d?rik=9YXZ4S4tY%2bm2%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1",
                   fit: BoxFit.cover,
                  hieght: 160,width: 160),
                ),
                SizedBox(height: 17,),
                Text("Ahmed",style: TextStyle(
                  color: Colors.white
                )),
                SizedBox(height: 6,),
                Text("01212040281",style: TextStyle(
                  color: Colors.white
                ),)
              ],
            ),
          ),
            const SizedBox(height: 24,),
            ...List.generate(listDrawer.length, (index) =>
            listDrawer[index].text=="Enable Easy Login"?Container(
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsetsDirectional.only(bottom: 16,start: 16,end: 16),

                height: 56,
                color: const Color(0xff284243).withOpacity(.10),
                width: 322,
                child: Row(
                  children:[ TextButton.icon(style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder()
                  ),
                      onPressed: (){},
                      icon: const AppImage("assets/svg/easy_login.svg"), label: const Text("Enable Easy Login",style: TextStyle(
                          color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16
                      ),
                      ),
                  ),
                    Switch(value: switchValue, onChanged:(value) {
                      switchValue=value;
                      setState(() {

                      });
                    },
                      // activeColor:  const Color(0x0fffffff),
                      // activeTrackColor: const Color(0xff2F65F0),
                      // inactiveTrackColor: Colors.grey,
                    )
                ]),
              ):listDrawer[index].text=="Logout"?
    Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsetsDirectional.only(bottom: 16,start: 16,end: 16),

      height: 56,
      color: const Color(0xffF60000).withOpacity(.10),
      width: 322,
      child: TextButton.icon(style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder()
      ),
          onPressed: (){
        navigateTo(const TranqLoginView(),keepHistory: false);
          },
          icon: const AppImage("assets/svg/log_out.svg"), label: const Text("Logout",style: TextStyle(
              color: Color(0xffF60000),fontWeight: FontWeight.w400,fontSize: 16
          ))),
    ):
               Container(
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsetsDirectional.only(bottom: 16,start: 16,end: 16),

              height: 56,
              color: const Color(0xff284243).withOpacity(.10),
              child: TextButton.icon(style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder()
              ),
                  onPressed: ()async{
                if(listDrawer[index].text=="About Us"){
                  navigateTo(const AboutUsPage(),);
                }else if(listDrawer[index].text=="Suggestions"){
                  navigateTo(const SuggestionPage(),keepHistory: true);
                }else if(listDrawer[index].text=="Rate Our App"){
                  await launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=com.tencent.ig"));
                }
                  },
                  icon: AppImage(listDrawer[index].icon), label: Text(listDrawer[index].text,style: const TextStyle(
                      color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16
                  ),) ),
            ), )
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigateTo(const ProfilePage(),keepHistory: true);
      },
                  shape: const CircleBorder(),
                  backgroundColor: const Color(0xff284243),
                  child:  Image.asset("assets/images/chat2.png"),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex=value;
          setState(() {

          });
        },
        items: List.generate(modelNavigationBar.length, (index) => BottomNavigationBarItem(
          backgroundColor: AppTheme.primary,
          icon: AppImage(modelNavigationBar[index].image,width: 24,hieght: 24,color: Colors.grey),
          label: modelNavigationBar[index].title,
          activeIcon: AppImage(modelNavigationBar[index].image,width: 24,hieght: 24,color: Colors.white),
        ),growable: true
        ),
      ),
    );
  }
}
class DrawerModel{
  final String text,icon;

  DrawerModel({required this.text, required this.icon});
}
