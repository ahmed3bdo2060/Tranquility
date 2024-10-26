import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';

class NewGridViewss extends StatefulWidget {
  const NewGridViewss({super.key});

  @override
  State<NewGridViewss> createState() => _NewGridViewState();
}

class _NewGridViewState extends State<NewGridViewss> {
  @override
   void initState() {
    super.initState();
    getData();
    // TODO: implement initState
    
  }
  List<MovieModel> list = [];
  bool isLoading = true;
  Future<void> getData()async{
    final response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9");
    final movies= response.data["results"] as List;
    movies.forEach((element) {
      final movie = MovieModel(title: element["original_title"],
          image: element["backdrop_path"]);
      list.add(movie);
    });
    isLoading = false;
    setState(() {

    });
    // final response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9");
    // final movies = response.data["results"] as List;
    // movies.forEach((element) {
    //    final movie = MovieModel(
    //        image: element["backdrop_path"]??"",
    //        title: element["original_title"]);
    //    list.add(movie);
    // });
    // isLoading = false;
    // setState(() {
    //
    // });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
         centerTitle: true,
         title: Text("Movies App"),
      ),
      body: isLoading?Center(child: CircularProgressIndicator()):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12), itemBuilder: (context, index) => Stack(
        fit: StackFit.expand,
        children: [
          AppImage(list[index].image,fit: BoxFit.cover,width: double.infinity),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              child: Text(list[index].title,style: TextStyle(
                color: Colors.white,
              ),textAlign: TextAlign.center),
              width: double.infinity,
              padding: EdgeInsets.only(top: 8,bottom: 8),
              color: Colors.black.withOpacity(.8),
            ),
          )
        ],
      ),
          itemCount: list.length),
      // body:isLoading?Center(child: CircularProgressIndicator(),) : GridView.builder(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),itemCount: list.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 12,
      //   mainAxisSpacing: 12
      // ), itemBuilder: (context, index) => Stack(
      //   fit: StackFit.expand,
      //   alignment: AlignmentDirectional.bottomCenter,
      //   children: [
      //  Image.network(
      //       list[index].image,fit: BoxFit.cover,width: double.infinity),
      //     Align(
      //       alignment: AlignmentDirectional.bottomCenter,
      //       child: Container(
      //         height: 40,
      //         alignment: AlignmentDirectional.center,
      //         width: double.infinity,
      //         child: Text(list[index].title,
      //         style: TextStyle(
      //           color: Colors.white
      //         )),
      //         color: Colors.black.withOpacity(.8),
      //       ),
      //     )
      //   ],
      // ),),
    );
  }
}
class MovieModel{
  late String image;
  final String title;

  MovieModel({required this.title,required this.image}){
    image = image.isEmpty?"https://th.bing.com/th/id/OIP.xjJQYPq-KlFeHuKk5BAP-AHaHa?rs=1&pid=ImgDetMain"
        :"https://image.tmdb.org/t/p/original$image";
  }
}

// class MovieModel{
//    late String image;
//   final String title;
//
//   MovieModel({required this.image, required this.title}){
//     image = image.isEmpty
//         ? "https://th.bing.com/th/id/OIP.xjJQYPq-KlFeHuKk5BAP-AHaHa?rs=1&pid=ImgDetMain"
//         : "https://image.tmdb.org/t/p/original$image";
//   }
// }