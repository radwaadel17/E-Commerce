import 'package:app/cubits/cart%20cubit/CartCubit.dart';
import 'package:app/cubits/cart%20cubit/states.dart';
import 'package:app/cubits/total%20sum%20cubit/states.dart';
import 'package:app/cubits/total%20sum%20cubit/totalsumCubit.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/widgets/cart%20item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addTocartPage extends StatefulWidget {
  const addTocartPage({super.key});

  @override
  State<addTocartPage> createState() => _addTocartPageState();
}

class _addTocartPageState extends State<addTocartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kcolor,
      appBar: AppBar(
        backgroundColor: Kcolor,
        title: Padding(
          padding: EdgeInsets.only(right: 50.w),
          child: Center(
            child: Text(
              'Cart',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is AddToCartStates) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartProduct(
                          index: index,
                          model: state.CartData[index],
                        ),
                      );
                    },
                    itemCount: state.CartData.length,
                  );
                } else if (state is RemoveFromCartState) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartProduct(
                          model: state.CartData[index],
                          index: index,
                        ),
                      );
                    },
                    itemCount: state.CartData.length,
                  );
                } else {
                  return Center(
                    child: Text('No items here'),
                  );
                }
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: Kcolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Kcolortxt.withOpacity(0.5),
                  spreadRadius: 0.2.r,
                  blurRadius: 1.r,
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Price',
                        style: TextStyle(color: Kcolortxt, fontSize: 15.sp),
                      ),
                      BlocBuilder<Totalsumcubit, MainSatate>(
                        builder: (context, state) {
                          if (state is SumState) {
                            return Text('${state.sum.toStringAsFixed(2)} \$',
                                style: TextStyle(fontSize: 15.sp));
                          } else {
                            return Text('0.0 \$',
                                style: TextStyle(fontSize: 15.sp));
                          }
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(endIndent: 25, indent: 25),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyle(color: Kcolortxt, fontSize: 15.sp),
                      ),
                      Text('Freeship', style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(endIndent: 25, indent: 25),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(color: Kcolortxt, fontSize: 15.sp),
                      ),
                      BlocBuilder<Totalsumcubit , MainSatate>(
                        builder: (context, state) {
                          if(state is SumState){
                            return Text('${(state.sum + 40).toStringAsFixed(2)} \$',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold));
                          }
                          else {
                             return Text('0.00\$',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(endIndent: 25, indent: 25),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KButtonColor,
                    fixedSize: Size(250.w, 40.h),
                  ),
                  child: const Text(
                    "Proceed to checkout",
                    style: TextStyle(fontSize: 17, color: Kcolor),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
