import 'package:flutter/material.dart';

class MonthView extends StatefulWidget {
  const MonthView({super.key});

  @override
  State<MonthView> createState() => _MonthViewState();
}
String? selectedMonth;
final monthNumberController=TextEditingController();
final List months=[
  "يناير",
  "فبراير",
  "مارس",
  "ابريل",
  "مايو",
  "يونيو",
  "يوليو",
  "اغسطس",
  "سبتمبر",
  "اكتوبر",
  "نوفمبر",
  "ديسمبر"
];

class _MonthViewState extends State<MonthView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 80,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset("assets/images/month.png",
                    height: 230,
                    width: 240,
                  fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: monthNumberController,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.number,
                onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  labelText: "رقم الشهر",
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff0F006D)
                  ),
                  hintText: "ادخل رقم الشهر",
                  counterStyle: const TextStyle(
                    fontSize: 18
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff0F006D)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xff0F006D),
                      width: 2
                    )
                  )
                ),
              ),
              const SizedBox(height: 39,),
              FilledButton(onPressed: (){
                int number = int.tryParse(monthNumberController.text)??0;
                if(number>=1&&number<=12) {
                  selectedMonth = months[number - 1];
                }else{
                  selectedMonth = "invalid month";
                }
                setState(() {

                });
              },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff0F006D),
                  fixedSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))
                ),
                  child: const Text("احصل على النتيجه",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
              ),
              const SizedBox(height: 44,),
              if(selectedMonth!=null)
               Center(
                child: Text("اسم الشهر :$selectedMonth ",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0F006D)
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
