import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/services/Update%20product.dart';
import 'package:app/widgets/TextField%20name.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class updateProductPage extends StatefulWidget {
  const updateProductPage({super.key , required this.model});
  final ProductModel model ;

  @override
  State<updateProductPage> createState() => _updateProductPageState();
}

class _updateProductPageState extends State<updateProductPage> {
  String? name;
  String? des;
  String? Price;
  String? image;
  bool isLoading = false ;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading ,
      child: Scaffold(
        backgroundColor: Kcolor,
        appBar: AppBar(
          backgroundColor: Kcolor,
          title: Padding(
            padding: EdgeInsets.only(right: 50.w),
            child: Center(
              child: Text(
                'Update Product',
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
            NameTxt(onChanged: (data) {
              name = data;
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
            NameTxt(
              onChanged: (data) {
              des = data; 
            }
            ),
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
            NameTxt(onChanged: (data) {
              Price = data;
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
            NameTxt(onChanged: (data) {
              image = data;
            }),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  isLoading = true;
                  setState(() {});
                  try {
                    postR();
                    print('Sucsess');
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: KButtonColor,
                  fixedSize: Size(250.w, 46.h),
                ),
                child: const Text(
                  "Update Product",
                  style: TextStyle(fontSize: 17, color: Kcolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postR() async{
    await UpdateProduct(Dio()).updateProduct(
      category: widget.model.categorey,
      price: Price == null ? widget.model.price! : Price!,
      title: name == null ? widget.model.title : name!,
      description: des == null ? widget.model.description : des!,
      image: widget.model.Image,
      id: widget.model.id,
    );
  }
}
