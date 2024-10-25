import 'package:app/helper/Constants.dart';
import 'package:app/helper/Home%20Page%20data%20builder.dart';
import 'package:app/widgets/Home%20page%20grid.dart';
import 'package:app/widgets/ProductCard.dart';
import 'package:app/widgets/customContainercategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    print('$name');
    return Scaffold(
      backgroundColor: Kcolor,
      appBar: AppBar(
        backgroundColor: Kcolor,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 2.h),
            child: const Icon(
              Icons.notifications_active,
              color: KButtonColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
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
          SizedBox(
            height: 25.h,
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
            height: 15.h,
          ),
          SizedBox(
            height: 50.h,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
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
          HomePageBuilder(nameCategory: name),
        ],
      ),
    );
  }
}




