import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/views/Update%20product%20page.dart';
import 'package:app/widgets/ColorContainer.dart';
import 'package:app/widgets/SizesContainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<String> Sizes = const ['S', 'M', 'L', 'XL', 'XXL'];
  int selected = 0;
  int selectedColor = 0;
  List<Color> colorList = [
    Colors.brown,
    Colors.black,
    Colors.grey,
    Colors.teal,
  ];
    bool Isread = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Kcolor,
      body: Center(
        child: Stack(
          children:[ 
            
            ListView(
            children: [
           
              SizedBox(
                height: MediaQuery.of(context).size.height/60,
              ),
              Container(
                height: MediaQuery.of(context).size.height *0.25 ,
                
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.productModel.Image))),
              ),
              Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
               padding: EdgeInsets.only(left: 40.w),
               child: Text(
                 widget.productModel.categorey,
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   fontSize: 16.sp,
                   color: Kcolortxt,
                   fontWeight: FontWeight.w600,
                 ),
               ),
                                ),
                                
                              ],
                            ),
                     
                             Padding(
               padding: EdgeInsets.symmetric(horizontal: 38.w),
               child: Row(
                 children: [
                   Icon(
                     Icons.star_sharp,
                     color: Colors.yellow,
                   ),
                   Text('${widget.productModel.rating.rate}'),
                 ],
               ),
                                ),
                                SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 39.w),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.productModel.title,
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   //color: K,
                   fontSize: 20.sp,
                   fontWeight: FontWeight.w600,
                 )),
                              ),
                            ),
                      
                            SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            Row(
                              children: [
                                Padding(
               padding: EdgeInsets.only(left: 40.w),
               child: Text(
                 'Product Details',
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   fontSize: 16.sp,
                   color: Kcolortxt,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 15.w),
                child: Text(
                  '${widget.productModel.description}',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    overflow: Isread == true ? null : TextOverflow.ellipsis,
                  ),
                  maxLines: Isread == true ? null : 3 ,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, right: 15.w),
                child: GestureDetector(
                  onTap: (){
                   setState(() {
                     Isread = !Isread;
                   });
                  },
                  child: Text(
                    Isread ? 'Read less' : 'Read more',
                    style: TextStyle(
                       fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      color: KButtonColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const Divider(
                endIndent: 50,
                indent: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.w),
                    child: Text(
                      'Select Size',
                      style: TextStyle(
                         fontFamily: 'Montserrat',
                   //color: Kcolortxt,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600,
                 ),
               ),
                                ),
                              ],
                            ),
                             SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            SizedBox(
                              height: 39.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 29.w),
                                child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: Sizes.length,
                 itemBuilder: (context, index) {
                   bool isSelected = selected == index;
                 
                   return GestureDetector(
                       onTap: () {
                         setState(() {
                           selected = index;
                         });
                       },
                       child: SizesContainer(
                         txt: Sizes[index],
                         isSelected: isSelected,
                       ));
                 }),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            Row(
                              children: [
                                Padding(
               padding: EdgeInsets.only(left: 40.w),
               child: Text(
                 'Select Color',
                 
                 style: TextStyle(
                   fontFamily: 'Montserrat',
                   //color: Kcolortxt,
                   fontSize: 16.sp,
                   fontWeight: FontWeight.w600,
                 ),
               ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 29.w),
                                child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: colorList.length,
                 itemBuilder: (context, index) {
                   bool ch = selectedColor == index;
                   return GestureDetector(
                       onTap: () {
                         setState(() {
                           selectedColor = index;
                         });
                       },
                       child: ColorContainer(
                         color: colorList[index],
                         ch: ch,
                       ));
                 }),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height/60,
                            ),
                          Padding(
                            padding:EdgeInsets.only(left: 40.w),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  PageAnimationTransition(
                                    page: updateProductPage(), 
                                    pageAnimationType: BottomToTopFadedTransition())
                                );
                              },
                              child: Text(
                                'Update Product' , 
                              
                              style: TextStyle(
                                color: KButtonColor,
                                fontSize: 16.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: 100.h,
                            ),
              
            ],
                      ),
        
          Positioned(
            bottom: 0.h,
            right: 0.w,
            left: 0.w,
            child: Container(
              height: MediaQuery.of(context).size.width*0.16,
              decoration: BoxDecoration(
                color: Kcolor,
                borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(30.r),
                 topRight: Radius.circular(30.r),
                 
          
                ),
              boxShadow: [
                  
                  BoxShadow(
                       color: Kcolortxt.withOpacity(0.5),
                       spreadRadius: 1.r,
                       blurRadius: 1.r,
                  )

              ]           
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                     '${widget.productModel.price}\$', 
                     style: TextStyle(
                       fontFamily: 'Montserrat',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                     ),
                  ),
                  ElevatedButton(onPressed: (){}
                  
                  ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KButtonColor,
                  ), child: Row(
                    children: [
                       const Icon(
                        Icons.shopping_cart,
                        color: Kcolor,
                       ),
                       SizedBox(width: 10.w,),
                       const Text('Add to cart' ,
                       
                       style: TextStyle(
                         fontFamily: 'Montserrat',
                           color: Kcolor ,
                           fontWeight: FontWeight.w600,
                       ),
                       ),
                    ],
                  ),
            
                  )
                ],
              ),
            ),
          )
          ]
          
        ),
      ),
    );
  }
}
