import 'package:app/helper/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customContainerProducts extends StatelessWidget {
  const customContainerProducts({
    super.key,
    required this.selected ,
    required this.txt ,
  });
  final bool selected ; 
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Container(
          width: 110.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: selected == true ? KButtonColor : Kcolortxt,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                
                color: Kcolor ,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}