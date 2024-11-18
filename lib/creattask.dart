import 'package:demo1/toast%20massage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Creattask extends StatefulWidget {
  const Creattask({super.key});

  @override
  State<Creattask> createState() => _CreattaskState();
}

class _CreattaskState extends State<Creattask> {
  TextEditingController post = TextEditingController();
  final database=FirebaseDatabase.instance.ref("data");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
              backgroundColor: Colors.deepPurple,
              title: Padding(
                padding:  EdgeInsets.only(left: 60.w),
                child: Text(
                  "Creat task",
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ),
          SizedBox(width: 300.w,
            child: Padding(
              padding:  EdgeInsets.only(top: 30.h),
              child: TextFormField(
                controller: post,
                decoration: InputDecoration(
                  labelText: "Enter",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r))
                )
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 40.h),
            child: GestureDetector(onTap: (){
              final id = DateTime.now().microsecondsSinceEpoch.toString();
              database.child(id).set({"id":id,"title":post.text.toString()}).then((value) {
                ToastMessage().toastmessage(message: "successfully");
                post.clear();
                Navigator.pop(context);

              },
              ).onError((error, stackTrace) => ToastMessage().toastmessage(message: error.toString()),);
              
              
            },
              child: Container(
                width: 150.w,
                height: 45.h,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
                child:  Center(
                  child: Text(
                    'creat',
                    textAlign: TextAlign.center,
                    style:GoogleFonts.merriweather(textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontFamily: 'Urbanist',
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
