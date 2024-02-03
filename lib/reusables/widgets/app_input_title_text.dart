import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputTitleText extends StatelessWidget {
  const AppInputTitleText({super.key, required this.title});
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(title, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: greyColor),);
  }
}
