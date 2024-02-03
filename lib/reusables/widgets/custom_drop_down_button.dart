import 'package:complete_task_manager/reusables/colors.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.labelText,
  });

  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return DropdownButtonFormField2(
      hint: Text(
        'Select Status',
        style: myTextStyle.bodyMedium!.copyWith(color: greyColor),
      ),
      iconStyleData: IconStyleData(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: buttonTextColor,
        ),
        iconSize: 25.sp,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: backgroundColor
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        fillColor: backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: const BorderSide(color: greyColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28.r),
          borderSide: const BorderSide(color: greyColor, width: 1),
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString(),
              style: myTextStyle.bodyMedium),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}