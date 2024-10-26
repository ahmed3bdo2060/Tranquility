import 'package:flutter/material.dart';
import 'package:projects/core/design/app_input.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  final list = [
    "Text",
    "Image.asset",
    "Image.network",
    "Other",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("What is the Widget Used To Make Network Image?",
                    style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ) ,),
                  ...List.generate(list.length,
                          (index) => Column(
                            children:[ RadioListTile(
                                                groupValue:currentIndex ,
                                                title: Text(list[index]),
                                                contentPadding: EdgeInsets.zero,
                                                visualDensity:VisualDensity.compact,
                                                toggleable: true,
                                                onChanged: (value) {
                                                  currentIndex = value!;
                                                  setState(() {

                                                  });
                                                },
                                                value: index,
                                              ),
                              if(index == list.length-1&&index==currentIndex)
                                AppInput()
                          ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
