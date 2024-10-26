import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/products/product/model.dart';
import 'package:projects/products/slider/view.dart';
import 'package:projects/views/tranquility/onboard1.dart';

import 'category/view.dart';
import 'product/view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff16A124),
          centerTitle:true,
          title: Text("منتجاتنا",style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700
          )),
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SliderSection(),
              SizedBox(height: 16.h,),
              CategorySection(),
              SizedBox(height: 16.h,),
              ProductSection()
            ],
          ),
        ),
      ),
    );
  }
}
