import 'package:app/helper/Constants.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:app/widgets/TextField%20email.dart';
import 'package:app/widgets/TextField%20password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? Email;
  String? Passowrd;
  GlobalKey<FormState> formkay = GlobalKey();
  bool IsLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: Scaffold(
        backgroundColor: Kcolor,
        body: Form(
          key: formkay,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Fill your information below or register with your social accounts',
                      style: TextStyle(fontSize: 15.sp, color: Kcolortxt),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  EmailTxt(
                    onChanged: (data) {
                      Email = data;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  PassowrdTxt(
                    onChanged: (value) {
                      Passowrd = value;
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkay.currentState!.validate()) {
                        IsLoading = true;
                        setState(() {});
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: Email!,
                            password: Passowrd!,
                          );
                          ShowSnackbar(context, 'Sign up succesfully.');
                          Navigator.of(context).push(PageAnimationTransition(
                              page: SignIn(),
                              pageAnimationType: RightToLeftFadedTransition()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackbar(
                                context, 'The password provided is too weak.');
                            //print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            ShowSnackbar(context,
                                'The account already exists for that email.');
                          }
                        } catch (e) {
                          throw Exception(e.toString());
                        }
                        IsLoading = false;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 17, color: Kcolor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KButtonColor,
                      fixedSize: Size(250.w, 46.h),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w, // تحديد عرض الخط
                        height: 1.h, // تحديد سمك الخط
                        color: Kcolortxt, // لون الخط
                      ),
                      Text(
                        '  Or Sign Up With  ',
                        style: TextStyle(fontSize: 12.sp, color: Kcolortxt),
                      ),
                      Container(
                        width: 100.w, // تحديد عرض الخط
                        height: 1.h, // تحديد سمك الخط
                        color: Kcolortxt, // لون الخط
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/facebook.png'),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                            onTap: () {











                              
                            },
                            child: Image.asset('assets/images/google.png')),
                        SizedBox(
                          width: 20.w,
                        ),
                        Image.asset('assets/images/apple.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ? ",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: SignIn(),
                              pageAnimationType: RightToLeftFadedTransition()));
                        },
                        child: Text(
                          'Sign In ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: KButtonColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void ShowSnackbar(context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: Kcolor),
      ),
      backgroundColor: KButtonColor,
    ));
  }
}
