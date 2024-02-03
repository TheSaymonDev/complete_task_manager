import 'package:complete_task_manager/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

PinTheme pinTheme() {
  return PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(4.r),
    borderWidth: 1.w,
    fieldHeight: 46.h,
    fieldWidth: 46.w,
    activeColor: buttonTextColor,
    selectedColor: buttonTextColor,
    inactiveColor: greyColor,
  );
}

BoxDecoration decorationStyle(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(8.r),
    color: cardColor
  );
}

SnackbarController customErrorMessage({required dynamic message}) {
  return Get.snackbar('Error', message,
      icon: const Icon(Icons.error_outline, color: buttonTextColor,),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: redColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: buttonTextColor);
}

SnackbarController customSuccessMessage({required dynamic message}) {
  return Get.snackbar('Success', message,
      icon: const Icon(Icons.verified_outlined, color: buttonTextColor,),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: greenColor,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: buttonTextColor);
}

 SpinKitFadingCircle customCircularProgressIndicator = SpinKitFadingCircle(
  color: buttonTextColor,
  size: 50.0.r,
);

Future<dynamic> showDialogBox({
  required BuildContext context,
  required String title,
  required String middleText,
  required void Function()? onPressedCancel,
  required void Function()? onPressedConfirm,
}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: Theme.of(context).textTheme.titleLarge,
    middleText: middleText,
    middleTextStyle: Theme.of(context).textTheme.bodyMedium,
    backgroundColor: backgroundColor,
    barrierDismissible: false,
    radius: 15.r,
    actions: [
      TextButton(
          onPressed: onPressedCancel,
          child: Text(
            'No',
            style: Theme.of(context).textTheme.titleMedium,
          )),
      TextButton(
          onPressed: onPressedConfirm,
          child: Text(
            'Yes',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: blueColor),
          )),
    ],
  );
}