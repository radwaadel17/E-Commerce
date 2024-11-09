import 'package:app/cubits/fav%20cubit/addTofavcubit.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/views/Product%20details.dart';
import 'package:app/views/add%20to%20cart%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({super.key, required this.data});
  final List<ProductModel> data;

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  //bool IsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Kcolor,
          title: Padding(
            padding: EdgeInsets.only(right: 50.w),
            child: Center(
              child: Text(
                'All Items',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ),
      backgroundColor: Kcolor,
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return AllProductCard(
              model: widget.data[index],
            );
          },
        ),
      ),
    );
  }
}

class AllProductCard extends StatefulWidget {
  const AllProductCard({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  State<AllProductCard> createState() => _AllProductCardState();
}

class _AllProductCardState extends State<AllProductCard> {
  @override
  bool IsChecked = false;
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(PageAnimationTransition(
              page: ProductDetails(productModel: widget.model),
              pageAnimationType: TopToBottomFadedTransition()));
        },
        child: Card(
          color: Kcolor,
          shadowColor: const Color.fromARGB(255, 202, 200, 200),
          elevation: 2,
          child: Row(
            children: [
              SizedBox(
                  height: 90.h,
                  width: 90.w,
                  child: Image.network(widget.model.Image)),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.title.substring(0, 11),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "${widget.model.price}\$",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rating: ${widget.model.rating!.rate}",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Kcolortxt),
                        ),
                        Icon(Ionicons.star , color: Colors.yellow,size: 10,) 
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        // bottom: 23.h,
        right: 0.w,
        top: 5.h,
        child: IconButton(
            onPressed: () {
              IsChecked = !IsChecked;
              setState(() {});
              IsChecked == true
                  ? BlocProvider.of<AddToFavCubit>(context)
                      .favMethod(widget.model)
                  : BlocProvider.of<AddToFavCubit>(context)
                      .remove(widget.model);
            },
            icon: IsChecked == true
                ? const Icon(
                    Icons.favorite_sharp,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border)),
      )
    ]);
  }
}
