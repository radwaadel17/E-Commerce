import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/widgets/ProductCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePageGrid extends StatelessWidget {
  const HomePageGrid({
    super.key,
    required this.data,
  });
 final List<ProductModel> data ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.width * 0.6 ,
        crossAxisSpacing: 5.0.w,
        mainAxisSpacing: 1.0.h,
          ),
          itemCount:data.length,
          itemBuilder: (context, index) {
            return ProductCard(model: data[index],);
          },
        ),
      ),
    );
  }
}