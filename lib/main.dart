import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projects/core/logic/app_theme.dart';
import 'package:projects/core/logic/cash_helper.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/products/category/view.dart';
import 'package:projects/products/contactus/bloc.dart';
import 'package:projects/products/login/view.dart';
import 'package:projects/service_locator.dart';
import 'package:projects/tasks/chat.dart';
import 'package:projects/tasks/gridview.dart';
import 'package:projects/tasks/sql/sqlhelper.dart';
import 'package:projects/views/tranquility/home/pages/drawer/about_page.dart';
import 'package:projects/views/tranquility/home/view.dart';
import 'package:projects/views/tranquility/second_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/design/new_onboard.dart';
import 'learn_api/injection.dart';
import 'login/view.dart';
import 'my-map.dart';
import 'products/cart/view.dart';
import 'products/category/bloc.dart';
import 'products/contactus/view.dart';
import 'products/login/bloc.dart';
import 'products/product/bloc.dart';
import 'products/slider/bloc.dart';
import 'tasks/new_grid.dart';
import 'products/products.dart';
import 'tasks/radio.dart';
import 'tasks/sql/view.dart';
import 'views/tranquility/changepassword.dart';
import 'views/tranquility/gridview_gded.dart';
import 'views/tranquility/home/pages/chat2.dart';
import 'views/tranquility/home/pages/drawer/suggestion.dart';
import 'views/tranquility/home/pages/edit_profile.dart';
import 'views/tranquility/home/pages/fun.dart';
import 'views/tranquility/home/pages/profile.dart';
import 'views/tranquility/home/pages/quotes.dart';
import 'views/tranquility/home/pages/setting.dart';
import 'views/tranquility/on_board.dart';
import 'views/tranquility/tran_login.dart';
import 'tasks/validator.dart';
Future<void> main()async {
  initGetIt();
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefss =await SharedPreferences.getInstance();
   await CashHelper.init();
   await SqlHelper.open();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
          path: "assets/translation",

          supportedLocales: [
            Locale("en"),
            Locale("ar"),
            Locale("fr"),
          ],
          fallbackLocale: Locale("en"),
          startLocale: Locale("en"),
          child: ScreenUtilInit(
        designSize: Size(430,932),
        child:  MyGridView(),
        builder: (context, child) => MaterialApp(
            navigatorKey: navigatorKey,
            theme: AppTheme.light,
            debugShowCheckedModeBanner: false,
            title: "tranquility",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home:child
        ),
      ),
    );
  }
}


