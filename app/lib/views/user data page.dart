import 'dart:io';
import 'package:app/views/Home%20page.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/widgets/TextField%20name.dart';
import 'package:app/widgets/TextFiled%20number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserDataPage extends StatefulWidget {
  const UserDataPage({super.key, required this.email});
  final String email;
  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  String? Name;
  String? PhoneNumber;
  GlobalKey<FormState> formkey = GlobalKey();
  CollectionReference users =
      FirebaseFirestore.instance.collection('UsersData');
   
  File? _imageFile; 
  String? path;
  Future _PickImage() async {
   final returnedIamge = await ImagePicker().pickImage(source: ImageSource.gallery);
   if (returnedIamge == null) return ;
    setState(() {
       path = returnedIamge!.path ;
      _imageFile =File(returnedIamge!.path);
    });
  }
   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor,
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Complete Your Profile',
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Don't worry, only you can see your personal data. No one else will be to see it",
                    style: TextStyle(fontSize: 15.sp, color: Kcolortxt),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Stack(children: [
                  Container(
                    width: 150.w,
                    height: 150.w,
                    decoration: BoxDecoration(
                      color: Kcolortxt,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: ClipOval(
                        child: _imageFile == null ? Padding(
                          padding: EdgeInsets.all(25.r),
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.fill,
                          ),
                        ) : Image.file(File(path!) ,  fit: BoxFit.fill)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10.w,
                    child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: KButtonColor,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: IconButton(
                          onPressed: () {

                            _PickImage();
                          },
                          icon: Icon(
                            Icons.upload_rounded,
                            color: Kcolor,
                            size: 16.h,
                          )),
                    ),
                  )
                ]),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                NameTxt(onChanged: (data) {
                  Name = data;
                }),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                PhoneNumberTxt(onChanged: (data) {
                  PhoneNumber = data;
                }),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    users
                        .add({
                          'e': widget.email,
                          'p': PhoneNumber,
                          'n': Name,
                          'image' : path ,
                          'isProfileCompleted' : true ,
                        })
                        .then((value) => print("User Added"))
                        .catchError(
                            (error) => print("Failed to add user: $error"));
                    
      
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context).push(
                        PageAnimationTransition(
                            page: Home_page(email: widget.email,),
                            pageAnimationType: RightToLeftFadedTransition()),
                      );
                    }
                  },
                  child: Text(
                    "Complete Profile",
                    style: TextStyle(fontSize: 17, color: Kcolor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KButtonColor,
                    fixedSize: Size(250.w, 40.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
