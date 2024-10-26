
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:projects/core/design/app_image.dart';

class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  @override
  void initState() {
    super.initState();
    initPlayer();
    // TODO: implement initState
  }
  Future<void> initPlayer ()async{
     await player.setUrl('https://server8.mp3quran.net/ahmad_huth/001.mp3');
     player.positionStream.listen((event) {
       setState(() {

       });
     });
     player.playerStateStream.listen((event) {
       if(event.processingState==ProcessingState.completed){
         player.stop();
         player.seek(Duration.zero);
       }
      setState(() {

      });
    });
   }
  final player = AudioPlayer();
  double sliderValue =0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Column(
        children: [
          AppImage("https://i.ytimg.com/vi/WOGOYpqHEkQ/maxresdefault.jpg",
          width: double.infinity,fit: BoxFit.cover,hieght: 400,),
          SizedBox( height: 24,),
          Text("All of the light",style: TextStyle(color: Colors.white,
          fontSize: 36,fontWeight: FontWeight.w400),),
          Text("Kanye West",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0xff868686)
          ),),
          SizedBox(height: 83,),
          player.duration==null?Center(child: CircularProgressIndicator(
            color: Colors.red,
          ),):Slider(
            activeColor: Colors.red,
             divisions: player.duration!.inSeconds,
             label: "seconds ${player.position.inSeconds}",
             inactiveColor: Color(0xff808080),
            min: 0,
            max: player.duration!.inSeconds.toDouble(),
            value: player.position.inSeconds.toDouble(),
            onChanged: (value)async{
              await player.seek(Duration(seconds: value.truncate()));
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("00:${player.position.inSeconds.toString().padLeft(2,'0')}",style: TextStyle(
                  color: Colors.white
                )),
                Text("00:${player.duration?.inSeconds??"00"}",
                style: TextStyle(
                  color: Colors.white
                ),),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {

              }, icon: AppImage("assets/svg/back.svg")),
              IconButton(onPressed: ()async {
                if(player.playing){
                  player.pause();
                }else{
                  player.play();
                }

              }, icon: player.playing?AppImage("assets/images/pause.png",hieght: 120,width: 120,):
              AppImage("assets/images/play.png",hieght: 120,width: 120,)),
              IconButton(onPressed: () {

              }, icon: AppImage("assets/svg/next.svg")),
            ],
          )
        ],
      ) 
      
    );
  }
}
