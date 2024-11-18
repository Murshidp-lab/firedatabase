import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatefulWidget {
  final String verification;
  const Otp({super.key, required this.verification});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otp=TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  final Formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Text(
                'OTP Verification',
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
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: Text(
                  'Enter the verification code we just sent on your email address.',
                  style:GoogleFonts.merriweather(textStyle:
                  TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                )),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 30.h),
              child: OtpTextField(
                textStyle:TextStyle(
                color: Colors.white
              ),
                enabledBorderColor: Colors.white,
                numberOfFields: 4,
                borderColor:Colors.white,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20.w,top: 50.h),
              child: Container(
                width: 300.w,
                height: 45.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
                child:  Center(
                  child: Text(
                    'Verify',
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
            )
          ],
        ),
      ),
    );
  }
}
