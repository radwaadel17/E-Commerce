import 'package:app/helper/Constants.dart';
import 'package:app/widgets/TextField%20name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class updateProductPage extends StatefulWidget {
  const updateProductPage({super.key});

  @override
  State<updateProductPage> createState() => _updateProductPageState();
}

class _updateProductPageState extends State<updateProductPage> {
  String? name ;
  String? des ;
  String? Price ;
  String? image ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kcolor,
        appBar: AppBar(
          backgroundColor: Kcolor,
          title: Padding(
          padding:EdgeInsets.only(right: 50.w),
          child: Center(
            child: Text('Update Product' , 
                 style: TextStyle(
                    fontSize: 16.sp,
                 ),
            ),
          ),
        ),
        ),
      body: ListView(
        children: [
          SizedBox(
                    height: MediaQuery.of(context).size.height * 0.125,
                  ),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Product Name: ',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
          NameTxt(onChanged: (data){
             name = data ;
          }),
           SizedBox(
                    height: 10.h,
                  ),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Product Description ',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
          NameTxt(onChanged: (data){
             name = des ;
          }),
           SizedBox(
                    height: 10.h,
                  ),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Product Price',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
          NameTxt(onChanged: (data){
             name = Price ;
          }),
           SizedBox(
                    height: 10.h,
                  ),
          Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      children: [
                        Text(
                          'Product Image',
                          style: TextStyle(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
          NameTxt(onChanged: (data){
             name = des ;
          }),
          SizedBox(
                    height: 10.h,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
              onPressed: () {
                
              },
              child: Text(
                "Update Product",
                style: TextStyle(fontSize: 17, color: Kcolor),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: KButtonColor,
                fixedSize: Size(250.w, 46.h),
              ),
                        ),
            ),
        ],
      ),
    );
  }
}