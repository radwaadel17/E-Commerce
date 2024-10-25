import 'package:app/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.color ,
    required this.ch ,
  });
  final Color color ;
  final bool ch ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  10.w),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.r),
          border: ch == true ? Border.all(color: Kcolortxt , width: 5.w , strokeAlign: BorderSide.strokeAlignOutside) : Border.all(color: color),
        ),
      ),
    );
  }
}

