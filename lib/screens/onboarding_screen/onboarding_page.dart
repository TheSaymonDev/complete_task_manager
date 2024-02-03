import 'package:carousel_slider/carousel_slider.dart';
import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/app_outlined_button.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_in_page.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  List<String> slideTextList = [
    'Update Progress Your Work for The Team',
    'Create a Task and Assign it to Your Team Members',
    'Get Notified when you Get a New Assignment'
  ];

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Transform(
            transform: Matrix4.identity()
              ..translate(-30.0, 30.0)
              ..rotateZ(-0.70),
            child: Container(
              width: 480.w,
              height: 395.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF8E8E93),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: double.infinity.h,
            width: double.infinity.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CarouselSlider.builder(
                  itemCount: slideTextList.length,
                  itemBuilder: (context, index, realIndex) => SizedBox(
                    height: double.infinity.h,
                    width: 343.w,
                    child: Text(
                      slideTextList[index],
                      style: myTextStyle.titleLarge!.copyWith(fontSize: 35.sp),
                    ),
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    initialPage: 0,
                    height: 123.h,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                ),
                Gap(32.h),
                SmoothPageIndicator(
                  controller: PageController(initialPage: _currentPage),
                  count: slideTextList.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8.0.h,
                    dotWidth: 14.0.w,
                    activeDotColor: blueColor,
                    dotColor: cardColor,
                  ),
                  onDotClicked: (index) => setState(() => _currentPage = index),
                ),
                Gap(36.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomBlueElevatedButton(onPressed: () {Get.to(const SignUpPage());}, buttonName: 'Sign Up'),
                ),
                Gap(16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: AppOutlinedButton(onPressed: () {Get.to(const SignInPage());}, buttonName: 'Sign In'),
                ),
                Gap(52.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
