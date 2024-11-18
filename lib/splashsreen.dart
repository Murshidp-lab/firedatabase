import 'dart:async';

import 'package:demo1/Home_screen.dart';
import 'package:demo1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashsreen extends StatefulWidget {
  const Splashsreen({super.key});

  @override
  State<Splashsreen> createState() => _SplashsreenState();
}

class _SplashsreenState extends State<Splashsreen> {


  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() async {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("token")){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomeScreen()),(route)=> false);
      }else{
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Login()),(route)=> false);
      }
    });
    return Scaffold(
      body: Column(
        children: [

Center(child: Image.asset("assets/b.png",height: 200.h,width: 200.w,))



        ],
      ),
    );
  }
}
