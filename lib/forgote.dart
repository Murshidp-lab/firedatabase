import 'package:demo1/toast%20massage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forgote extends StatefulWidget {
  const Forgote({super.key});

  @override
  State<Forgote> createState() => _ForgoteState();
}

class _ForgoteState extends State<Forgote> {
  TextEditingController email =TextEditingController();
  FirebaseAuth auth =FirebaseAuth .instance;
  final Formekey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(key: Formekey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(onTap: (){Navigator.of(context).pop();},
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 345.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 10.h),
                    child: Text(
                      'Dont worry! It occurs. Please enter the email address linked with your account.',
                      style: TextStyle(
                        color: Color(0xFF8390A1),
                        fontSize: 16.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 320.w,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 20.w,top: 40.h),
                    child: TextFormField(
                      controller: email,
                     validator: (email){
                        if (email!.isEmpty ||
                       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                       .hasMatch(email)){
                          return "Enter your email";
                        }
                     },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Enter your email",

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 20.w,top: 50.h),
                  child: GestureDetector(onTap: (){
                    auth.sendPasswordResetEmail(email: email.text).then((value) {
                      ToastMessage().toastmessage(message: "password changed successfully");
                    },).onError((error,StackTrace){
                      ToastMessage().toastmessage(message: error.toString());
                    });
                  },
                    child: Container(
                      width: 300.w,
                      height: 45.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Send Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 70.w,top: 250.h),
                  child: Row(
                    children: [
                      Text(
                        'Remember Password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ), Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
