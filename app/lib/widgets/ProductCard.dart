import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({super.key , required this.model});
 final ProductModel model ;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  height: 140.h,
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
              Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 25.w),
                    child: Text(model.categorey  , 
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis
                    
                    ),
                    maxLines:2,
                    ),
                  ),
                ],
              ),
               Row(
                children: [
                  Padding(
                    padding:EdgeInsets.only(left: 25.w),
                    child: Text('${model.price}\$'  , 
                    style: TextStyle(
                      fontSize: 15.sp,
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
                      fontSize: 15.sp,
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
          bottom: 23.h,
          right: 0.w,
          child:IconButton(onPressed: (){}, icon: Icon(
            Icons.favorite_border,
            color: KButtonColor,
          )) 
        )
      ],
    );
  }
}