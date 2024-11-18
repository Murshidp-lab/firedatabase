import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/toast%20massage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final auth = FirebaseAuth.instance;
  final Task = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection("data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.deepPurple,
            title: Padding(
                padding: EdgeInsets.only(left: 60.w),
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
          SizedBox(
            width: 300.w,
            height: 100.h,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: "Enter your task",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r))),
                controller: Task,
                validator: (email) {
                  if (email!.isEmpty) {
                    return "Enter somthing";
                  }
                  return null;
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final id = DateTime.now().microsecondsSinceEpoch.toString();
              firestore
                  .doc(id)
                  .set({"id": id, "title": Task.text.toString()}).then((value) {
                ToastMessage().toastmessage(message: "Task added");
                Task.clear();
                Navigator.of(context).pop();

              }).onError((error, StackTrace) {
                ToastMessage().toastmessage(message: error.toString());
              });
            },
            child: Container(
              width: 150.w,
              height: 40.h,
              decoration: ShapeDecoration(
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
              ),
              child: Center(
                child: Text(
                  'Creat ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
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
