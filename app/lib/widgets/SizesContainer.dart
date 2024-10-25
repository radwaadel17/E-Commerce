import 'package:app/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizesContainer extends StatelessWidget {
  const SizesContainer({
    super.key,
    required this.txt,
    required this.isSelected,
  });
 final String txt ;
 final bool isSelected ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  10.w),
      child: Container(
        height: 39,
        width: 39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: isSelected == true ? KButtonColor : null,
          border: Border.all(
            color: KButtonColor,
            
          ),
        ),
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              color: isSelected == true ? Kcolor : Colors.black,
              fontSize: 12.sp),
          ),
        ),
      ),
    );
  }
}
