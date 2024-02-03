import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_text_form_field.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            size: 24.sp,
            color: buttonTextColor,
          ),
        ),
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: CircleAvatar(
                    backgroundColor: textColor,

                  ),
                ),
              ),
              Gap(30.h),
              const AppInputTitleText(title: 'Your Email Address'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.mail_outline_sharp,
                hintText: 'Enter your email address',
                readOnly: true,
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your First Name'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.person,
                hintText: 'Enter your first name',
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your Last Name'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.person,
                hintText: 'Enter your last name',
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your Mobile Number'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.phone_android,
                hintText: 'Enter your mobile number',
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your Password'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.key,
                hintText: 'Enter your password',
              ),
              Gap(30.h),
              CustomBlueElevatedButton(onPressed: () {}, buttonName: 'Update'),
            ],
          ),
        ),
      ),
    );
  }
}
