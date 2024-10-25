import 'package:app/helper/Constants.dart';
import 'package:app/models/ui%20models/onboarding%20model.dart';
import 'package:app/views/Sign%20in%20page.dart';
import 'package:app/widgets/onboarding%20screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding_screen extends StatelessWidget {
  onboarding_screen({super.key});
  final List<Onboarding> data = const [
    Onboarding(
        img: 'assets/images/Onboarding 7 1.png',
        txt1: 'Seamless ',
        txt2: 'Shopping',
        txt3: 'Experience',
        txt4:
            'Shopping experience offers customers a smooth, intuitive journey from browsing to checkout. It integrates personalized recommendations, easy navigation.'),
    Onboarding(
        img: 'assets/images/Onboarding 8 1.png',
        txt1: 'Wishlist: Where ',
        txt2: 'Fashion',
        txt3: 'Dreams Begin',
        txt4:
            'Offers a curated selection of trendy and timeless pieces, designed to inspire your unique style.'),
    Onboarding(
        img: 'assets/images/Onboarding 9 1.png',
        txt1: 'Swift and ',
        txt2: 'Reliable',
        txt3: 'Deleviry',
        txt4:
            'Favorite fashion pieces arrive quickly and securely, allowing you to enjoy a hassle-free shopping experience.'),
  ];
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnboard,
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return OnBoardScreen(
                  obj: data[index],
                );
              }),
          Positioned(
              bottom: 50.h,
              right: 15.w,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.page!.toInt() < data.length - 1) {
                    controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  } else if (controller.page!.toInt() == data.length - 1) {
                    Navigator.of(context).push(PageAnimationTransition(
                        page: SignIn(),
                        pageAnimationType: RightToLeftFadedTransition()));
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Kcolor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: KButtonColor,
                  fixedSize: Size(100, 40),
                ),
              )),
          Positioned(
              top: 50.h,
              right: 15.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(PageAnimationTransition(
                      page: SignIn(),
                      pageAnimationType: RightToLeftFadedTransition()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      // color: KButtonColor,
                      fontSize: 15.sp),
                ),
              )),
          Positioned(
            bottom: 30.h,
            left: 149.w,
            child: SmoothPageIndicator(
              controller: controller,
              count: data.length,
              effect: WormEffect(
                dotHeight: 10.h,
                dotWidth: 10.w,
                activeDotColor: KButtonColor,
                type: WormType.thinUnderground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
