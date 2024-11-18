import 'package:demo1/Home_screen.dart';
import 'package:demo1/botton.dart';
import 'package:demo1/forgote.dart';
import 'package:demo1/phoneverification.dart';
import 'package:demo1/register.dart';
import 'package:demo1/screen.dart';
import 'package:demo1/toast%20massage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
final GoogleSignIn googleSignIn=GoogleSignIn();
  Future<void>signinwithgoogle()async{
    try {
      final GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount!.authentication;

      final AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );

      final UserCredential userCredential= await auth.signInWithCredential(credential);
      final User? user= userCredential.user;
      if (user!=null) {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
        ToastMessage().toastmessage(message: 'succusfully completed');
      }
    } catch (e) {
      ToastMessage().toastmessage(message: e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 330.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Text(
                      'Welcome back! Glad to see you, Again!',
                      style:GoogleFonts.merriweather(textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 27.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 20.h),
                  child: SizedBox(
                    width: 330.w,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: email,
                      decoration: InputDecoration(
                          labelText: "Enter your email",

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (email) {
                        if (email!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                          return "enter a valid email";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 15.h),
                  child: SizedBox(
                    width: 330.w,
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      controller: password,
                      decoration: InputDecoration(
                          labelText: "Enter your password",

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      validator: (pass) {
                        if (pass!.isEmpty || pass.length < 6) {
                          return "Enter six letters";
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 210.w, top: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Forgote()));
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style:GoogleFonts.merriweather(textStyle: TextStyle(
                        color: Color(0xFF6A707C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
        ) ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 50.h),
                  child: GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        auth
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then(
                              (value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Botton())),
                                CheckLogin()
                              },
                            )
                            .onError(
                              (error, stackTrace) => ToastMessage()
                                  .toastmessage(message: error.toString()),
                            );
                      }
                    },
                    child: Container(
                      width: 330.w,
                      height: 50.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(textStyle:TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
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
                        style:GoogleFonts.merriweather(textStyle: TextStyle(
                          color: Color(0xFF6A707C),
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
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
                  padding: EdgeInsets.only(left: 60.w, top: 20.h),
                  child: Row(
                    children: [
                      GestureDetector(onTap: (){
                        signinwithgoogle();
                      },
                        child: Container(
                            width: 100.w,
                            height: 50.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 1, color: Color(0xFFDADADA)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Image.asset("assets/a.png")),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 100.w,
                        height: 50.h,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFDADADA)),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Phoneverification()));
                          },
                          child: Icon(
                            Icons.call_outlined,
                            color: Colors.white,
                            size: 40.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, top: 70.h),
                  child: Row(
                    children: [
                      Text(
                        'Don’t have an account?',
                        style:GoogleFonts.merriweather(textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Register()));
                        },
                        child: Text(
                          'Register Now',
                          style:GoogleFonts.merriweather(textStyle:TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
