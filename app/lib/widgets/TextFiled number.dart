import 'package:app/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PhoneNumberTxt extends StatelessWidget {
  const PhoneNumberTxt({super.key , required this.onChanged});
  final Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: TextInputType.phone,
        validator: (data){
         if(data ==''){
          return 'This filed is required';
         }
        },
        decoration: InputDecoration(
          
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: Kcolortxt)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.r),
            borderSide: BorderSide(color: Colors.brown), // اللون البني بعد الضغط
          ),
        ),
        
      ),
    );
  }
}