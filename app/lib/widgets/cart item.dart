import 'package:app/cubits/cart%20cubit/CartCubit.dart';
import 'package:app/cubits/total%20sum%20cubit/totalsumCubit.dart';
import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CartProduct extends StatefulWidget {
  const CartProduct({
    super.key,
    required this.model,
    required this.index ,
  });

  final ProductModel model;
  final index; 
  @override
  State<CartProduct> createState() => _CartProductState();
}


class _CartProductState extends State<CartProduct> {
  int num = 1 ;
  dynamic totalsum = 0 ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalsum = widget.model.price;
    BlocProvider.of<Totalsumcubit>(context).addItem(widget.index, widget.model.price);
  }
  void minus(){
  if(num > 1){
    num--;
  }
  totalsum = widget.model.price *  num ;
  BlocProvider.of<Totalsumcubit>(context).addItem(widget.index, totalsum);
  setState(() {
    
  });
}
void increment(){
  num++;
  totalsum = widget.model.price * num ;
  BlocProvider.of<Totalsumcubit>(context).addItem(widget.index, totalsum);
  setState(() {
    
  });

}
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 99.h,
        width: 300.w,
        child: Stack(
          children:[ Card(
            color: Kcolor,
            shadowColor: const Color.fromARGB(255, 202, 200, 200),
            elevation: 2,
            child: Row(
              children: [
                SizedBox(height: 90.h, width:90 ,child: Image.network(widget.model.Image)),
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
                      SizedBox(height: 5.h,),
                      Text(
                      "${widget.model.price * num}\$",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 5.h,),
                      Row(
                        children: [
                          Text(
                            "Size: ${widget.model.size}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Kcolortxt),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Color : ${widget.model.color}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Kcolortxt),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
            Positioned(
              right: 15.w,
              bottom: 20.h,
              child: Container(
                height: 22.h,
                width: 55.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: KButtonColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: increment,
                        child: Text('+' , style: TextStyle(color: Kcolor),)),
                      Text('$num' ,  style: TextStyle(color: Kcolor)),
                      GestureDetector(
                        onTap: minus,
                          // print('${widget.model.total}');
                        
                        child: Text('-' ,  style: TextStyle(color: Kcolor , fontSize: 15.sp))),
    
                    ],
                  ),
              )),
              Positioned(
                top: 15.h,
                right: 20.w,
                child: GestureDetector(
                  
                  onTap: (){
                    BlocProvider.of<CartCubit>(context).removeFromcart(widget.model);
                    BlocProvider.of<Totalsumcubit>(context).removeItem(widget.index);
                  },
                  child: Text('Delete' , style: TextStyle(color: Colors.red , fontSize: 13.sp) ,))
              )
        ]
        ),
      ),
    );
  }
}
