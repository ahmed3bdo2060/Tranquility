
import 'package:flutter/material.dart';

import 'home.dart';
import 'model.dart';

class NewPlayView extends StatelessWidget{

   NewPlayView({super.key});
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            runApp(MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            ),
            );
          },icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: Center(
        child: Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: moedel.length,
          itemBuilder: (context, index) =>
              Container(
                width: 400,
                height: 250,
                margin: EdgeInsets.all(10),
                  child: Image.network(moedel[index].image,
                      fit: BoxFit.cover)),),
          // child: SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     mainAxisSize:  MainAxisSize.max,
          //      children: [
          //        Image.network(moedel[0].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[1].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[2].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[3].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[4].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[5].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[6].image),
          //        SizedBox(width: 10,),
          //        Image.network(moedel[7].image),
          //        SizedBox(width: 10,),
          //      ],
          //   ),
          // ),
        ),
      ),
    );
  }

}