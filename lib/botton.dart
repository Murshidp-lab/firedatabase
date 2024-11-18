import 'package:demo1/Home_screen.dart';
import 'package:demo1/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Botton extends StatefulWidget {
  const Botton({super.key});

  @override
  State<Botton> createState() => _BottonState();
}

class _BottonState extends State<Botton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.deepPurple,
            title: Padding(
                padding: EdgeInsets.only(left: 80.w),
                child: Text(
                  "Datas",
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20.w,top: 200.h),
            child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));},
              child: Container(
                width: 300.w,
                height: 100.h,
                decoration: ShapeDecoration(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                child: Center(
                  child: Text(
                    'Real Time ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(textStyle:TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20.w,top: 30.h),
            child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen()));},
              child: Container(
                width: 300.w,
                height: 100.h,
                decoration: ShapeDecoration(
                  color: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                child: Center(
                  child: Text(
                    'Fire Storage ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(textStyle:TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
