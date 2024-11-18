import 'package:demo1/otp.dart';
import 'package:demo1/toast%20massage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Phoneverification extends StatefulWidget {
  const Phoneverification({super.key});

  @override
  State<Phoneverification> createState() => _PhoneverificationState();
}

class _PhoneverificationState extends State<Phoneverification> {
  TextEditingController phone = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final Formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Form(
          key: Formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(onTap: () {
                Navigator.of(context).pop();
              },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 30.h),
                child: Text(
                  "Phone verification",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 331.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Text(
                    'Dont worry! It occurs. Please enter the email addresslinked with your account.',
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
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.datetime,
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    controller: phone,
                    decoration: InputDecoration(
                        prefix: Text('+91 '),
                        filled: true,
                        fillColor: Colors.grey,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Phone number',

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 50.h),
                child: GestureDetector(onTap: () {
                  auth.verifyPhoneNumber(
                    phoneNumber: "+91${phone.text.toString()}",
                    verificationCompleted: (_){

                    },
                    verificationFailed: (error){
                      ToastMessage().toastmessage(message: error.toString());
                    },
                    codeSent: (String verificationId,int?token)async{
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>Otp(verification: verificationId,)));
                    }, codeAutoRetrievalTimeout: (error) {
                      ToastMessage().toastmessage(message: error.toString());
                  }

                      );
                },
                  child: Container(
                    width: 310.w,
                    height: 45.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
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


            ],
          ),
        ),
      ),
    );
  }
}
