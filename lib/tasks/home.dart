import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/tasks/new_play.dart';
import 'package:projects/tasks/splash.dart';
import 'package:transparent_image/transparent_image.dart';

import 'model.dart';

class HomeView extends StatefulWidget{

   const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex=0;
  final List moedel = [
    Model(image:"https://th.bing.com/th/id/R.7cdf60c7cd8b2b14995694dcd7c99e06?rik=3obl%2fhI6QdNIMA&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2ffree-beautiful-place-wallpaper-hd-173.jpg&ehk=92RRpT4hrYheMDBZkK0HhLLXx9%2fGDjnafeDmbgjE1K8%3d&risl=1&pid=ImgRaw&r=0",text: "song1",time: "10:10" ),
    Model(image:"https://th.bing.com/th/id/R.9d812e0638aec020faa11d89795bb90f?rik=A006j6sL742cww&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f07%2fnatural-landscape-purple-lake-wallpaper-.jpg&ehk=pAMyN7JHIDi73moP1dIjfu7zY10pXVNw92GFzZalDaE%3d&risl=&pid=ImgRaw&r=0",text: "song2",time: "20:10" ),
    Model(image:"https://th.bing.com/th/id/R.eb7a38c8773fa37bd7457cd41377d676?rik=hDvIJUOdbOUGOQ&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f04%2fsunrise2pelee.jpg&ehk=8%2b0uYNfXcKb6LCc0W4OXWJNqC5gxQqpoyrIXZPpdWNg%3d&risl=&pid=ImgRaw&r=0",text: "song3",time: "30:10" ),
    Model(image:"https://th.bing.com/th/id/R.3cae2d778bce92f366249e3584f206b5?rik=D%2fbAhrw3QJQUrA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-GX7q-ScmeLg%2fTl8FoAN2P0I%2fAAAAAAAAAvw%2fBpPsqjzw66Q%2fs1600%2f8.jpg&ehk=91ulvHpq1b3k1rDq3wNhi8ENDo9lmt1Sb9XLLniSPE0%3d&risl=&pid=ImgRaw&r=0",text: "song4",time: "40:10" ),
    Model(image:"https://th.bing.com/th/id/R.3d88a927f8529dcba03364b09d98adbe?rik=JYmQaMVSULpYQg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-images.jpg&ehk=BNPsuSOUR7ATZ3EpRwxx1xFl7LUbO3tYlu1wFLCBrCE%3d&risl=&pid=ImgRaw&r=0",text: "song5",time: "50:10" ),
    Model(image:"https://wallup.net/wp-content/uploads/2016/01/132930-nature-landscape-flowers.jpg",text: "song6",time: "60:10" ),
    Model(image:"https://th.bing.com/th/id/R.e6b1c97fb4168768bd9863cb910c0772?rik=cjT3N1tX5SL2MA&riu=http%3a%2f%2f4.bp.blogspot.com%2f-s7KrC4Vio_s%2fUAkCZ4KDUII%2fAAAAAAAACtw%2fbXYxmLo3jq8%2fs1600%2fmountan-reflection-on-lake-nature-background.jpg&ehk=rlt52XqepvP6Jf7dWMRkWcllEwwxMISJm83Bv%2fNCMxo%3d&risl=&pid=ImgRaw&r=0",text: "song7",time: "70:10" ),
    Model(image:"https://images.squarespace-cdn.com/content/v1/51a8f870e4b02509ec24213a/1575352696924-HEUAOA7R8DN15EMFFS2V/ke17ZwdGBToddI8pDm48kPqQfq0L3n3wpHIsRapTfg8UqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKczo5Zn4xktlpMsMj-QlHXeMfNK6GwvtVkYEWiR8XAPyD3GfLCe_DXOSC_YcAacWL_/CBDD97EF-651F-4148-A917-2F53223BB01F.jpeg",text: "song8",time: "80:10" ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff05A59B),
                Color(0xff000000)
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd
            )
          ),
          child: SafeArea(
            child: GridView.builder(
              itemCount: moedel.length,
              padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 160/191
            ),
              itemBuilder: (BuildContext context, int index)=>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:  MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      children:[
                         const Center(child: CircularProgressIndicator()),
                        Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                  color: Colors.transparent,),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          runApp(MaterialApp(
                                            debugShowCheckedModeBanner: false,
                                            home: NewPlayView(),
                                          ));
                                        },
                                        child: FadeInImage.memoryNetwork(
                                            placeholder: kTransparentImage,
                                            image: moedel[index].image,
                                          fit: BoxFit.cover,
                                        height: 195),
                                      ),
                                    )
                                    // Image.network(moedel[index].image,
                                    // fit: BoxFit.cover,)
                      ),
                                        ),
                    ]),
                  ),
         Text(moedel[index].text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                        letterSpacing: 3
                      ),
        ),
         Text(moedel[index].time,
                      style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
                        color: Colors.white
        ),
        )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
          actions: [
             TextButton(onPressed: (){
               runApp(const MaterialApp(
                 debugShowCheckedModeBanner: false,
                 home: SplashView(),
               ));
             },
               child:const Text("SplashView",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.white
              ),), ),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.broadcast_on_home,
              color: Colors.white,)
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_up_sharp,
              color: Colors.white,)
            ),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.mail,
                  color: Colors.white,)),
            IconButton(onPressed: (){},
                icon: const Icon(Icons.notifications,
                color: Colors.white,)),
          ],
        ),
        bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            currentIndex=value;
            if(currentIndex==1){
              runApp(const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: SplashView(),
              ));
            }
            setState(() {

            });
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xffFFFFFF),
          unselectedItemColor: const Color(0xffAAA9A9),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/home.svg",
                  color: const Color(0xffAAA9A9)),
              activeIcon: SvgPicture.asset("assets/svg/home.svg",
                  color: const Color(0xffFFFFFF)),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/feed.svg",
                  color: const Color(0xffAAA9A9)),
              activeIcon: SvgPicture.asset("assets/svg/feed.svg",
                  color: const Color(0xffFFFFFF)),
              label: "Feed"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/search.svg",
                  color: const Color(0xffAAA9A9)),
              activeIcon: SvgPicture.asset("assets/svg/search.svg",
                  color: const Color(0xffFFFFFF)),
              label: "Search"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/library.svg",
                  color: const Color(0xffAAA9A9)),
              activeIcon: SvgPicture.asset("assets/svg/library.svg",
                  color: const Color(0xffFFFFFF)),
              label: "Library"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/upgrade.svg",
                  color: const Color(0xffAAA9A9)),
              activeIcon: SvgPicture.asset("assets/svg/upgrade.svg",
                  color: const Color(0xffFFFFFF)),
              label: "Upgrade"
            ),
          ],
        ),
      ),
    );
    //   Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: Container(
    //     decoration: const BoxDecoration(gradient: LinearGradient(colors: [
    //       Color(0xff05A59B),
    //       Color(0xff000000)
    //     ],
    //     begin: AlignmentDirectional.topStart,
    //     end: AlignmentDirectional.bottomEnd)
    //     ),
    //     child: SafeArea(
    //       child: GridView.builder(
    //         padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             crossAxisSpacing: 8,
    //             mainAxisSpacing: 8,
    //             childAspectRatio: 195/191
    //             // childAspectRatio: 195/191
    //           ),
    //
    //         itemBuilder: (context, index) => Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 // height: 139,
    //                 // width: 195,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(16),
    //                 color: Colors.amberAccent,),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(16),
    //                   child: Image.network("https://th.bing.com/th/id/R.7af50c605c253277149e5cfeb2a04fe7?rik=XTS4jaY12q5%2f8Q&riu=http%3a%2f%2fwallpapercave.com%2fwp%2fnsu3cSp.jpg&ehk=r6S5dxn%2fMOlEelz3NkjBAzbLWSH70w5hsFwj0M0xZWg%3d&risl=&pid=ImgRaw&r=0",
    //                   fit: BoxFit.cover,),
    //                 ),
    //               ),
    //             ),
    //             const Text("Song Name",
    //             style: TextStyle(
    //               fontWeight: FontWeight.w400,
    //               fontSize: 14
    //             ),
    //             ),
    //             const Text("10:10",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                   fontSize: 12
    //               ),
    //             ),
    //           ],
    //         )
    //       ),
    //     ),
    //   ),
    //   appBar: AppBar(
    //     backgroundColor:  Colors.transparent,
    //     elevation: 0,
    //     title: const Text("Home",
    //     style: TextStyle(
    //       fontWeight: FontWeight.w600,
    //       fontSize: 18,
    //       color: Colors.white
    //     ),
    //     ),
    //     actions: [
    //       const Text("UPGRADE",style: TextStyle(
    //         color: Colors.white,
    //         fontSize: 12,
    //         fontWeight: FontWeight.w400
    //       ),
    //       ),
    //       IconButton(onPressed: (){},
    //           icon: Image.asset("assets/images/wifi.png",
    //             height: 16,
    //             width: 20,)
    //       ),
    //       IconButton(onPressed: (){},
    //           icon: const Icon(Icons.arrow_circle_up_outlined,
    //             color: Colors.white,)
    //       ),
    //       IconButton(onPressed: (){},
    //           icon: const Icon(Icons.forward_to_inbox_outlined,
    //             color: Colors.white,)
    //       ),
    //       IconButton(onPressed: (){},
    //           icon: const Icon(Icons.notifications,
    //             color: Colors.white,)
    //       )
    //     ],
    //   ),
    // );
  }
}