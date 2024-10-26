
import 'package:flutter/material.dart';

class GraidiantsViews extends StatelessWidget{
  const GraidiantsViews({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 134,
              width: 361,
            decoration: const BoxDecoration(gradient: LinearGradient(
                colors: [
                  Color(0xffFFA8A8),
                Color(0xffFCFF00)],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd),
            ),
        ),
            const SizedBox(height: 16,),
            Container(
              height: 134,
              width: 361,
              decoration: const BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Color(0xff30CFD0),
                    Color(0xff330867)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd),
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              height: 134,
              width: 361,
              decoration: const BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Color(0xff84FAB0),
                    Color(0xff8FD3F4)],
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd),
              ),
            )
        ]),
      ),
    );
  }

}