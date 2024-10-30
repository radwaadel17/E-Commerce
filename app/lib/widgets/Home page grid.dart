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
     double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth < 600) { 
      crossAxisCount = 2; 
    } else if (screenWidth < 1200) {
      crossAxisCount = 3; 
    } else { // للشاشات الكبيرة
      crossAxisCount = 4; 
    }
    double itemwidth = screenWidth / crossAxisCount ;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio:(itemwidth / (itemwidth*1.2)),
        
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