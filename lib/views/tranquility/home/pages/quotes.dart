import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/helper_methods.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final list =[
    QuotesModel(title: "“ The only way to do great work is to love what you do “",
        author: "Steve Jobs"),
    QuotesModel(title: "The only limit to our realization of tomorrow will be our doubts of today.",
        author: "Franklin D.Roosevelt"),
    QuotesModel(title: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    QuotesModel(title: "In the middle of difficulty lies opportunity.",
        author: " Albert Einstein"),
    QuotesModel(title: "The greatest glory in living lies not in never falling, but in rising every time we fall",
        author: " Nelson Mandela"),
    QuotesModel(title: "Life is 10% what happens to us and 90% how we react to it.",
        author: "Charles R. Swindoll")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AppImage("assets/images/quotes (1).png",
           hieght: double.infinity,
          fit: BoxFit.cover),
          Container(
            color: Color(0xffD9D9D9).withOpacity(.50),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height ,
            child: PageView.builder( itemCount: list.length,itemBuilder: (context, index) => Center(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical:36 ),
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:Colors.white.withOpacity(.71)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: AppImage("assets/svg/icon.svg",color: Colors.black,)),
                      Text(list[index].title,
                        style: TextStyle(
                            fontSize: 34,
                            color: Theme.of(context).primaryColor
                        ),textAlign: TextAlign.center,),
                      SizedBox(height: 16,),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(list[index].author,textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w400
                          ),),
                      ),
                      SizedBox(height: 8,),
                      TextButton(onPressed: (){
                        FlutterClipboard.copy(list[index].title).then(( value ) {
                          showMessage("Text Copied Success");
                        },
                        );
                      }, child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Copy",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor
                            ),
                          ),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.copy,color: Theme.of(context).primaryColor,))
                        ],
                      ))
                
                    ],
                  ),
                ),
              ),
            ),),
          )
        ],
      ),
    ) ;
  }
}
class QuotesModel{
  final String title,author;

  QuotesModel({required this.title, required this.author});
}