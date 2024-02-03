import 'package:complete_task_manager/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBlueElevatedButton extends StatelessWidget {
  const CustomBlueElevatedButton({super.key, required this.onPressed, required this.buttonName});

  final String buttonName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: double.infinity.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: blueColor, foregroundColor: textColor),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: buttonTextColor),
        ),
      ),
    );
  }
}
