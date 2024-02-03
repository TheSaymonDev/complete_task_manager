import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/screens/onboarding_screen/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 96.w,
                height: 96.h,
                padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.h),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SvgPicture.asset(
                  'assets/images/Layout.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Gap(32.h),
              Text(
                'RANCANG',
                style: myTextStyle.titleLarge!.copyWith(fontSize: 35.sp),
              ),
              Gap(8.h),
              Text(
                'Your Personal Task Manager',
                style: myTextStyle.bodyMedium,
              ),
              Gap(264.h),
              SizedBox(
                height: 56.h,
                width: 341.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const OnboardingPage());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: blueColor, foregroundColor: textColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get Started',
                        style: myTextStyle.titleMedium,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: buttonTextColor,
                        size: 22.sp,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(52.h),
            ],
          ),
        ),
      ),
    );
  }
}
