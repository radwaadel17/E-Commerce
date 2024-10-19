import 'package:app/helper/Constants.dart';
import 'package:app/models/ui%20models/onboarding%20model.dart';
import 'package:app/widgets/TextField%20email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key, required this.obj});
  final Onboarding obj;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset(obj.img),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 270.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: Kcolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        obj.txt1,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: KButtonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        obj.txt2,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    obj.txt3,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    obj.txt4,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp, color: Kcolortxt),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
