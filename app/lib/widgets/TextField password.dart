import 'package:app/helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PassowrdTxt extends StatefulWidget {
  const PassowrdTxt({super.key , required this.onChanged});
  final Function(String)? onChanged ;

  @override
  State<PassowrdTxt> createState() => _PassowrdTxtState();
}
 
class _PassowrdTxtState extends State<PassowrdTxt> {
   bool obscure = true;
  void fun(){
    setState(() {
      obscure = !obscure ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 20.w),
      child: TextFormField(
        obscureText: obscure,
        onChanged: widget.onChanged,
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
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: IconButton(onPressed: fun, icon: Icon(
              
              obscure ? Icons.visibility : Icons.visibility_off,
            ))
          ),
        ),
        
      ),
    );
  }
}