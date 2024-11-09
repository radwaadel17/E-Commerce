import 'package:app/helper/Constants.dart';
import 'package:app/models/product%20model.dart';
import 'package:app/views/All%20items.dart';
import 'package:app/widgets/ProductCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class HomePageGrid extends StatelessWidget {
  const HomePageGrid({
    super.key,
    required this.data,
  });
  final List<ProductModel> data;
  @override
  Widget build(BuildContext context) {
    print("Data length: ${data.length}");

    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else if (screenWidth < 1200) {
      crossAxisCount = 3;
    } else {
      // للشاشات الكبيرة
      crossAxisCount = 4;
    }
    double itemwidth = screenWidth / crossAxisCount;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: AllProductsPage(
                        data: data,
                      ),
                      pageAnimationType: TopToBottomFadedTransition()));
                },
                child: Text(
                  'Show all',
                  style: TextStyle(
                    color: Kcolortxt,
                    fontSize: 12.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: (itemwidth.w / (itemwidth.w * 1.2)),
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ProductCard(
                model: data[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
