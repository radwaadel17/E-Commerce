import 'package:app/cubits/fav%20cubit/addTofavcubit.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/views/Product%20details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';


class ProductCard extends StatefulWidget {
  const ProductCard({super.key , required this.model});
  final ProductModel model ;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  bool IsChecked = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimationTransition(page: ProductDetails(productModel: widget.model), pageAnimationType: RightToLeftFadedTransition()));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Kcolor,
              borderRadius: BorderRadius.circular(30.r),
              
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SizedBox(
                height: 100.h,
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Image(image: NetworkImage(widget.model.Image)),
                )),
                Padding(
                  padding:EdgeInsets.only(left: 25.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(widget.model.title.substring(0 , 11), 
                    style: TextStyle(
                      // fontFamily: 'Montserrat',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
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
                      child: Text('${widget.model.price}\$'  , 
                      style: TextStyle(
                        // fontFamily: 'Montserrat',
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
                      size: 15,
                      ),
                    ),
                    Padding(
                      padding:EdgeInsets.only(left: 5.w),
                      child: Text('${widget.model.rating!.rate}'  , 
                      style: TextStyle(
                         fontFamily: 'Montserrat',
                        fontSize: 10.sp,
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
            top: 5.h,
            child:IconButton(onPressed: (){
              IsChecked = !IsChecked;
              setState(() {
                
              });
              IsChecked == true ? BlocProvider.of<AddToFavCubit>(context).favMethod(widget.model) : {
              BlocProvider.of<AddToFavCubit>(context).remove(widget.model)};
            }, icon: IsChecked == true ? const Icon(
              Icons.favorite_sharp,
              color: Colors.red,
            ) : const Icon(Icons.favorite_border)), 
          )
        ],
      ),
    );
  }
}