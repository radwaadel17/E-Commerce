import 'package:app/views/Home%20page.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/views/Sign%20up%20page.dart';
import 'package:app/views/user%20data%20page.dart';
import 'package:app/widgets/TextField%20email.dart';
import 'package:app/widgets/TextField%20password.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? Email;
  String? Password;
  bool IsLoading = false;
  CollectionReference Messages =
      FirebaseFirestore.instance.collection('UsersData');
  Future<String?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Sign in with the credential and return the UserCredential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Retrieve the email from the user object
    final String? email = userCredential.user?.email;

    // Return the email or null if it wasn't found
    return email;
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

  Future<void> checkProfileCompletion() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('UsersData');
    var userSnapshot = await users.where('e', isEqualTo: Email).get();
    print("Number of documents: ${userSnapshot.docs.length}");
    if (userSnapshot.docs.isNotEmpty) {
      var userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
      bool isProfileCompleted = userData['isProfileCompleted'] ?? false;

      if (isProfileCompleted) {
        const snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Congratulations!',
            message: 'Sucsess Login',
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Navigator.of(context).pushReplacement(
          PageAnimationTransition(
            page: Home_page(
              email: Email!,
            ),
            pageAnimationType: RightToLeftFadedTransition(),
          ),
        );
      } else if (isProfileCompleted == false) {
        Navigator.of(context).pushReplacement(
          PageAnimationTransition(
            page: UserDataPage(email: Email!),
            pageAnimationType: RightToLeftFadedTransition(),
          ),
        );
      }
      // print('$isProfileCompleted');
    } else {
      Navigator.of(context).pushReplacement(
        PageAnimationTransition(
          page: UserDataPage(email: Email!),
          pageAnimationType: RightToLeftFadedTransition(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: Scaffold(
        backgroundColor: Kcolor,
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      'Hi! , Welcome back you have been missed.',
                      textAlign: TextAlign.center,
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
                      Password = value;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 12.sp,
                            decoration: TextDecoration.underline,
                            color: KButtonColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        IsLoading = true;
                        setState(() {});
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: Email!,
                            password: Password!,
                          );

                          const snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Congratulations!',
                              message: 'Sucsess Login',
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                          checkProfileCompletion();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            const snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'User not found!',
                                message: 'No user found for that email',
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                            /* ShowSnackbar(
                                context, 'No user found for that email.');  */

                            //print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            const snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Wrong password!',
                                message:
                                    'Wrong password provided for that user',
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                        }
                        IsLoading = false;
                        setState(() {});
                      }
                    },
                    child: Text(
                      "Sign In",
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
                        '  Or Sign In With  ',
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
                        GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/images/facebook.png')),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                            onTap: () async {
                              IsLoading = true;
                              setState(() {
                                
                              });
                              String? mail = await signInWithGoogle();
                              Email = mail;
                              checkProfileCompletion();
                              IsLoading = false;
                              setState(() {
                                
                              });
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
                        "Don't have an account ? ",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageAnimationTransition(
                              page: SignUp(),
                              pageAnimationType: RightToLeftFadedTransition()));
                        },
                        child: Text(
                          'Sign Up ',
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
}
