import 'package:app/cubits/cart%20cubit/states.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/helper/Home%20Page%20data%20builder.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:app/views/add%20to%20cart%20page.dart';
import 'package:app/views/favourite%20page.dart';
import 'package:app/views/profile%20view.dart';
import 'package:app/widgets/customContainercategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:ionicons/ionicons.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
class Home_page extends StatefulWidget {
  const Home_page({super.key , required this.email});
  final String email ;
  @override
  State<Home_page> createState() => _Home_pageState();
}
 int selected = 0;
 String name ='All';
 const List<String> Categories = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
 ];
 bool showAll = false;
class _Home_pageState extends State<Home_page> {
  @override
   String path = 'path' ;
   String? UserName = 'username'; 
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
    UserName = userData['n'];    }
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: Kcolor,
      appBar: AppBar(
        title: Padding(
          padding:EdgeInsets.only(right: 1.w),
          child: Center(
            child: Text('FASHION' , 
                 style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                 ),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Kcolor,
        leading: IconButton(onPressed: (){

           PanaraConfirmDialog.show(
                context,
                title: "Are you sure?",
                message: "Do you want to log out ?",
                confirmButtonText: "Yes",
                cancelButtonText: "No",
                onTapCancel: () {
                  Navigator.of(context).pop(); 
                },
                onTapConfirm: () {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                     googleSignIn.disconnect();
                   Navigator.of(context).push(PageAnimationTransition(page: SignIn(), pageAnimationType: RightToLeftFadedTransition()));
                },
                panaraDialogType: PanaraDialogType.warning,
                barrierDismissible: false, // optional parameter (default is true)
              );
        
        }, icon: Icon(
          Icons.arrow_back,
        )),
        
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 2.h),
            child: SizedBox(
              height: 35.h,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(PageAnimationTransition(
                      page: addTocartPage(),
                      pageAnimationType: TopToBottomFadedTransition()));
                },
                child: Image.asset('assets/images/Frame 32 (2).png'))),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                          
                  children: [
                    Text('Hello , ${UserName}' , style: TextStyle(color: Kcolortxt , fontWeight: FontWeight.bold),),
                    SizedBox(height: 10.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        width:  342.w,
                        height: 40.h,
                        child: TextField(
                          
                          decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                          
                        borderRadius: BorderRadius.circular(24.r),
                        borderSide: BorderSide(color: Kcolortxt),
                                    
                          ),
                          
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.r),
                              borderSide: BorderSide(color: KButtonColor)
                          ),
                          labelText: 'Search' , 
                          prefixIcon: IconButton(onPressed: (){}
                          , icon: const Icon(
                            Icons.search,
                            color: KButtonColor,
                          ))
                          ),
                          
                          
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Text('Category' , 
                            style: TextStyle(
                              fontSize: 16.sp ,
                              fontWeight: FontWeight.w600,
                            ),
                           ),
                        ),
                      ],
                    ),
                      SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 45.h,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         
                          itemCount: Categories.length,
                          itemBuilder: (context , index) {
                            bool isSelected = selected == index ;
                           return GestureDetector( onTap: (){
                            setState(() {
                              selected = index; 
                              name = Categories[index];
                            });
                           }, 
                           child: customContainerProducts(selected: isSelected , txt: Categories[index],),
                           );
                          },
                       
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox
                    (
                      height: 168.h,
                      width: 311.w,
                      child: Stack(children: [Image.asset('assets/images/Mask Group.png'),
                      Positioned(
                        right: 15.w,
                        bottom: 30.h,
                        top: 30.h,
                        child: Container(
                          height: 93.h,
                          width: 116.w,
                          child: Text('Winter Collection 2025' , style: TextStyle(color: Kcolor , fontSize: 20.sp , fontWeight: FontWeight.bold),)))
                      ]
                      )),
                      
                      SizedBox(
                        height: 10.h,
                      ),
                      HomePageBuilder(nameCategory: name) ,
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 25.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text('Available offers' , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                           ),),
                          
                           
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 250.h,
                       // width: .w,
                        child: Image.asset('assets/images/banner 2 (1).png')),
                        SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              SizedBox(
                                height:180.h ,
                                child: Image.asset('assets/images/banner 3.png')),
                                SizedBox(
                                height:180.h ,
                                child: Image.asset('assets/images/banner 4.png'))
                          
                            ],
                          ),
                      SizedBox(height:50.h,),

                      
                  ],
                ),
                ),
              ),
            ],
          ),
          Positioned(
          bottom: 0.h,
          left: 0,
          right: 0,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: Kcolor,
                 boxShadow: [
                  BoxShadow(
                       color: Kcolortxt.withOpacity(0.5),
                       spreadRadius: 0.5.r,
                       blurRadius: 1.r,
                  )

              ]   
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  
                GestureDetector(
                  onTap: (){
                   
                     Navigator.of(context).push(
                      PageAnimationTransition(
                        page: Favourite(),
                       pageAnimationType: BottomToTopFadedTransition())
                    );
                  },
                  child: Icon(Ionicons.heart_outline ,)),
                  GestureDetector(
                  onTap: (){
                     Navigator.of(context).push(
                      PageAnimationTransition(
                        page: Home_page(email: widget.email),
                       pageAnimationType: BottomToTopFadedTransition())
                    );
                  },
                  child: Icon(Ionicons.home_outline, color: KButtonColor)),
                   GestureDetector(
                  onTap: (){
                     Navigator.of(context).push(
                      PageAnimationTransition(
                        page: addTocartPage(),
                       pageAnimationType: BottomToTopFadedTransition())
                    );
                  },
                  child: Icon(Ionicons.cart_outline)),
                  GestureDetector(
                  onTap: (){
                     Navigator.of(context).push(
                      PageAnimationTransition(
                        page: profilePage(email: widget.email),
                       pageAnimationType: BottomToTopFadedTransition())
                    );
                  },
                  child: Icon(Ionicons.person_outline)),

              ],
            ),
          ),
        )  
        ]
      ),
    );
  }
}




