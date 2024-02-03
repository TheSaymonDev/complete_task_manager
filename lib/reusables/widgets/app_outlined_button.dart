import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({super.key, required this.onPressed, required this.buttonName});

  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: buttonTextColor,
          side: BorderSide(width: 1.w, color: buttonTextColor),
        ),
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: buttonTextColor),
        ),
      ),
    );
  }
}
