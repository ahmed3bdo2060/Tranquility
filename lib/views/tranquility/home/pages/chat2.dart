import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/app_theme.dart';
import 'package:projects/core/logic/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

int currentIndex = 0;

class _ChatPageState extends State<ChatPage> {
  late List<ChatModel>list;
  bool isLoading = true;
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3));
    list = [
      ChatModel("About Work", "1/9/2021"),
      ChatModel("About My Family", "15/11/2022"),
      ChatModel("My self", "20/12/2023"),
    ];
    isLoading = false;
    setState(() {
    });
  }@override
  void initState() {
    super.initState();
    // TODO: implement initState
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:SafeArea(
        child:isLoading?const Center(
          child: CircularProgressIndicator(),
        ):list.isEmpty?const Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          AppImage("assets/svg/chat.svg",
              hieght: 200,
              width: 200,
              fit: BoxFit.fill,
              color: AppTheme.primary),
          SizedBox(height: 8,),
          Text("You don’t have any Chats yet.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),)])):
        ListView.separated(itemBuilder: (context, index) =>
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                      decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(list[index].titles),
                          Text(list[index].dates),
                        ],
                      )
                  ),
                ),
                IconButton(onPressed: (){
                  list.removeAt(index);
                  setState(() {

                  });
                },
                    icon: const Icon(Icons.delete,color: Colors.red,))
              ],
            ),
          separatorBuilder:(context, index) => const SizedBox(height: 16),
          itemCount: list.length,padding: const EdgeInsets.all(18),)
              )
          );
  }
}
