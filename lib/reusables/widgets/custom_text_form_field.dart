import 'package:complete_task_manager/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.readOnly = false,
      this.controller,
      this.validator,
      this.keyboardType});

  final IconData icon;
  final String hintText;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      cursorColor: buttonTextColor,
      validator: validator,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),
        prefixIcon: Icon(
          icon,
          size: 24.sp,
          color: greyColor,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: BorderSide(color: greyColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: BorderSide(color: greyColor, width: 1.w),
        ),
      ),
    );
  }
}
