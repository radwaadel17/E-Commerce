import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/widgets/ColorContainer.dart';
import 'package:app/widgets/SizesContainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor,
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Container(
              height: 130.h,
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
                      color: Kcolortxt,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 150.w),
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
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 39.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.productModel.title,
                    style: TextStyle(
                      //color: K,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Kcolortxt,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Container(
                    height: 90.h,
                    width: 300.w,
                    child: Text(
                      widget.productModel.description,
                      style: TextStyle(
                          //  color: Kcolortxt,
                          // fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15.sp),
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
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
                      //color: Kcolortxt,
                      fontSize: 16.sp,
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
              height: 10.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Text(
                    'Select Color',
                    style: TextStyle(
                      //color: Kcolortxt,
                      fontSize: 16.sp,
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
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: Text(
                    '${widget.productModel.price}\$',
                    style: TextStyle(
                      //color: Kcolortxt,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.of(context).pushReplacement(PageAnimationTransition(page: onboarding_screen(), pageAnimationType:RightToLeftFadedTransition()));
                    },
                    child: Text(
                      "Add to cart",
                      style: TextStyle(fontSize: 17, color: Kcolor),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KButtonColor,
                      fixedSize: Size(180.w, 40.h),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
