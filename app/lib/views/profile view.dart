import 'dart:io';

import 'package:app/helper/Constants.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key , required this.email});
   final String email ;

  @override
  State<profilePage> createState() => _profilePageState();
}
 
class _profilePageState extends State<profilePage> {
   String path = 'path' ;
   String? name = 'username'; 
  @override 
  void initState() {
    super.initState();
    getuserData();
    //
  }
  Future<void> getuserData() async{
    CollectionReference users =
        FirebaseFirestore.instance.collection('UsersData');
    var userSnapshot = await users.where('e', isEqualTo: widget.email).get();
    if(userSnapshot.docs.isNotEmpty){
    var userData = userSnapshot.docs.first.data() as Map<String, dynamic>;
    name = userData['n'];
    path = userData['image'];
    }
    setState(() {
      
    });
    print("Number of documents: ${userSnapshot.docs.length}");
    print(name);
    print(path);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: Padding(
          padding:EdgeInsets.only(right: 50.w),
          child: Center(
            child: Text('Profile' , 
                 style: TextStyle(
                    fontSize: 16.sp,
                 ),
            ),
          ),
        ),
      ),
      backgroundColor: Kcolor,
      body: ListView(
       children: [
               Center(
                 child: Stack(children: [
                    Container(
                      width: 150.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                        color: Kcolortxt,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: ClipOval(
                          child: path == 'path'? Padding(
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
                            },
                            icon: Icon(
                              Icons.upload_rounded,
                              color: Kcolor,
                              size: 16.h,
                            )),
                      ),
                    )
                  ]),
               ),
               SizedBox(
                height: 10.h,
               ),
               Center(
                 child: Text(name!, 
                  
                 style: TextStyle(
                  fontSize: 16.sp,

                 ),
                 ),
               ),
               Center(
                 child: Text(widget.email, 
                 style: TextStyle(
                  fontSize: 16.sp,
                 ),
                 ),
               ),
                SizedBox(
            height: 35.h,
          ),
          Features(
            txt: 'Payment Methods',
            icon: Icon(
              Icons.payment,
              color: KButtonColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Features(
            txt: 'My Orders',
            icon: Icon(
              Icons.shopping_bag,
              color: KButtonColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Features(
            txt: 'Settings',
            icon: Icon(
              Icons.settings,
              color: KButtonColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Features(
            txt: 'Privacy Policy',
            icon: Icon(
              Icons.privacy_tip,
              color: KButtonColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            onTap: (){
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              Navigator.of(context).push(PageAnimationTransition(page: SignIn(), pageAnimationType:RightToLeftFadedTransition()));
            },
            child: Features(
              txt: 'Log out',
              icon: Icon(
                Icons.logout,
                color: KButtonColor,
              ),
            ),
          ),

               
               
           ],
      
      ),

    );
  }
}

class Features extends StatelessWidget {
  const Features({
    super.key,
    required this.icon,
    required this.txt,
  });
  final Icon icon ;
  final String txt ; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
         children: [
           Padding(
             padding: EdgeInsets.only(left: 24.w),
             child: icon,
           ),
           Padding(
             padding: EdgeInsets.only(left: 15.w),
             child: Text(txt , style: TextStyle(fontSize: 16.sp , fontWeight: FontWeight.w700),),
           ) , 
          
    
         ],
        ),
        Divider(
         endIndent: 25,
         indent: 25,
        )
      ],
    );
  }
}