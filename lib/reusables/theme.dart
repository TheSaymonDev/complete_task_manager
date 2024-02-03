import 'package:complete_task_manager/reusables/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData customThemeStyle = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
  ),
  scaffoldBackgroundColor: backgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 25.sp,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
    bodySmall: TextStyle(
      fontSize: 15.sp,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
    titleLarge: TextStyle(
      fontSize: 25.sp,
      color: textColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      color: textColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      color: textColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1.h,
    ),
  ),
);
