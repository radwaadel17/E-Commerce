import 'dart:async';
import 'package:app/helper/Constants.dart';
import 'package:app/views/welcome%20screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splash_page extends StatefulWidget {
  const splash_page({super.key});

  @override
  State<splash_page> createState() => _splash_pageState();
}

class _splash_pageState extends State<splash_page> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5) , (){
      Navigator.of(context).push(PageAnimationTransition(page: Welcome_screen(), pageAnimationType: RightToLeftTransition()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor,
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
          child: Image.asset('assets/images/Splash (14) 1.png'))
      ],
     )
    );
  }
}
