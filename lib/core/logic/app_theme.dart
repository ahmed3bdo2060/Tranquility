import 'package:flutter/material.dart';

import '../../main.dart';

class AppTheme{
  static const primary = Color(0xff284243);
  static ThemeData get light=> ThemeData(fontFamily: "inter",
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16
            )
        )
    ),
    switchTheme: SwitchThemeData(
       trackColor: MaterialStateProperty.resolveWith((states) {
         if(!states.contains(MaterialState.selected)){
           return Color(0xffC0C0C0);
         }else{
           return primary;
         }
       })
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            fixedSize: const Size.fromHeight(60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            )
        )
    ),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor:  const Color(0xffACACAC).withOpacity(.1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8)
    )
    ),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
            0xff284243,
            {
              50:primary,
              100:primary,
              200:primary,
              300:primary,
              400:primary,
              500:primary,
              600:primary,
              700:primary,
              800:primary,
              900:primary,
            }
        ),
        backgroundColor: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xff284243),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    )
  );
}