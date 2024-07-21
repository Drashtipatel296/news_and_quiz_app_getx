import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/QUIZ%20APP/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 4), (){
      Get.to(const QuizScreen(),transition: Transition.zoom);
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Image.asset('assets/img/bg.png',fit: BoxFit.cover,),
    );
  }
}
