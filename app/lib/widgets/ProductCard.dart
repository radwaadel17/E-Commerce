import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/views/Product%20details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({super.key , required this.model});
 final ProductModel model ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimationTransition(page: ProductDetails(productModel: model), pageAnimationType: RightToLeftFadedTransition()));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Kcolor,
              borderRadius: BorderRadius.circular(30.r),
              
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Container(
                    height: 120.h,
                    //width: 200.h,
                    decoration: BoxDecoration(
                      color: Kcolor,
                      borderRadius: BorderRadius.circular(24 .r
                     ),
                     image: DecorationImage(
                      image: NetworkImage(model.Image)),
          
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left: 25.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(model.categorey  , 
                    style: TextStyle(
                       fontFamily: 'Montserrat',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis
                    ),
                    maxLines:2,
                    ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left: 25.w),
                      child: Text('${model.price}\$'  , 
                      style: TextStyle(
                         fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                  ],
                ),
                 Row(
      
                  children: [
                    Padding(
                      padding:EdgeInsets.only(left: 20.w),
                      child: Icon(
                      Icons.star_sharp,
                      color: Colors.yellow,
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 5.w),
                      child: Text('${model.rating.rate}'  , 
                      style: TextStyle(
                         fontFamily: 'Montserrat',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
           Positioned(
           // bottom: 23.h,
            right: 0.w,
            child:IconButton(onPressed: (){}, icon: Icon(
              Icons.favorite_border,
              color: KButtonColor,
            )) 
          )
        ],
      ),
    );
  }
}