import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
final listText = [
  "Welcome to Tranquility – your personal assistant in the digital world. At Tranquility, we believe that everyone deserves a moment of peace and calm amidst the chaos of everyday life. Our mission is to provide a sanctuary where you can unwind, destress, and find solace through meaningful conversations with our AI chatbot.",
  "In today's fast-paced world, it's easy to feel overwhelmed and anxious. That's why we've created Tranquility – to offer you a refuge where you can freely express yourself without fear of judgment or interruption. Whether you're seeking advice, a listening ear, or simply some company, our AI chatbot is here to support you every step of the way.",
  "Our team is passionate about mental well-being and technology, and we're dedicated to harnessing the power of AI to promote relaxation and mindfulness. With Tranquility, you can embark on a journey of self-discovery, self-care, and self-improvement, all from the comfort of your smartphone.",
  "So why wait? Take a deep breath, download Tranquility, and let our AI chatbot guide you on your path to inner peace and tranquility. Together, we can create a brighter, calmer future – one conversation at a time."
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us",style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(margin: EdgeInsets.symmetric(horizontal: 96),
                  child: AppImage("assets/images/about_image.png")),
              SizedBox(height: 24,),
              Text("Welcome to Tranquility\nwhere relaxation meets innovation.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16,),
              ...List.generate(listText.length, (index) => Container(
                  margin: EdgeInsets.only(left: 16,right: 16,bottom: 16),child: Text((listText[index]))))
              // ListView.separated(itemBuilder: (context, index) => Text(listText[index]),
              //     separatorBuilder: (context, index) => SizedBox(height: 12),
              //     itemCount: 3,shrinkWrap: true,padding: EdgeInsets.symmetric(horizontal: 16)),
              //
            ],
          ),
        ),
      ),
    );
  }
}
