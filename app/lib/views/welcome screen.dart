import 'package:app/helper/Constants.dart';
import 'package:app/main.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
class Welcome_screen extends StatelessWidget {
  const Welcome_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Image.asset('assets/images/Welcome Screen (5) 1.png'),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: Text(
                'The Fashion App That',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: Text(
                'Makes You Look Your Best',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                'Discover the latest trends and curate your perfect wardrobe with our fashion app, designed to elevate your style effortlessly',
                style: TextStyle(fontSize: 12.sp, color: Kcolortxt),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
            onPressed: () {

              Navigator.pushNamed(context, 'on');
            },
            child: Text(
              "Let's Get Started",
              style: TextStyle(fontSize: 17, color: Kcolor),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: KButtonColor,
              fixedSize: Size(250.w, 46.h),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Already have an account ?  ',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color.fromARGB(255, 38, 38, 38)),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                    Navigator.of(context).push(PageAnimationTransition(
                      page: SignIn(),
                      pageAnimationType: RightToLeftFadedTransition()));
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: KButtonColor,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
