import 'package:demo1/Home_screen.dart';
import 'package:demo1/toast%20massage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  final formekey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formekey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30.sp,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 350.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 20.h),
                    child: Text(
                      'Welcome back! Glad \nto see you, Again!',
                      style: GoogleFonts.merriweather(textStyle:TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 20.w),
                  child: SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: username,
                      decoration: InputDecoration(
                          labelText: "username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (username) {
                        if (username!.isEmpty) {
                          return "Enter username";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: email,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (email) {
                        if (email!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                          return "Enter valid email";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      controller: password,
                      decoration: InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (password) {
                        if (password!.isEmpty || password.length < 6) {
                          return "Enter six number";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      controller: confirmpass,
                      decoration: InputDecoration(
                          labelText: "Confirm password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (Confirmpassword) {
                        if (Confirmpassword!.isEmpty ||
                            password.text != confirmpass.text) {
                          return "Enter same password";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: GestureDetector(
                    onTap: () {
                      if (formekey.currentState!.validate()) {
                        auth
                            .createUserWithEmailAndPassword(
                                email: email.text.toString(), password: password.text.toString())
                            .then((value) => {
                                  ToastMessage().toastmessage(
                                      message: "Registration successfully"),
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => HomeScreen())),
                          CheckLogin()
                                })
                            .onError(
                              (error, stackTrace) => ToastMessage()
                                  .toastmessage(message: error.toString()),
                            );
                      }
                      formekey.currentState?.save();
                    },
                    child: Container(
                      width: 310.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Agree and Register',
                          textAlign: TextAlign.center,
                          style:GoogleFonts.merriweather(textStyle: TextStyle(
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
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE8ECF4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Or Login with',
                        style:GoogleFonts.abel(textStyle: TextStyle(
                          color: Color(0xFF6A707C),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 100.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE8ECF4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60.w, top: 40.h),
                  child: Row(
                    children: [
                      Container(
                          width: 100.w,
                          height: 50.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFDADADA)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Image.asset("assets/a.png")),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 100.w,
                        height: 50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFDADADA)),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Icon(
                          Icons.call_outlined,
                          color: Colors.white,
                          size: 40.sp,
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
  void CheckLogin() async {

    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("Token", true);
  }
}
