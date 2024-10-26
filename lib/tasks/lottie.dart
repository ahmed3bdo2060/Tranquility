import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiesView extends StatelessWidget {
  const LottiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Platform.isAndroid?
        Lottie.asset("assets/lotties/lottie.json",
            width: 200,
        height: 200):SizedBox(),
      ),
    );
  }
}
