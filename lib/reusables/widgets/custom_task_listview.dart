import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomTaskListView extends StatelessWidget {
  const CustomTaskListView({super.key, required this.taskList});

  final List taskList;

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return ListView.separated(
        itemBuilder: (context, index) {
          final task = taskList[index];
          return Card(
            elevation: 2,
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Container(
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
              decoration: decorationStyle(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task["title"],
                    style: myTextStyle.titleLarge,
                  ),
                  Gap(8.h),
                  Text(
                    task["description"],
                    style: myTextStyle.bodyMedium!.copyWith(color: greyColor),
                  ),
                  Gap(8.h),
                  Text(
                    task["createdDate"],
                    style: myTextStyle.titleMedium,
                  ),
                  Gap(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        height: 26.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: task["status"] == "New"
                                ? Colors.blue
                                : task["status"] == "Completed"
                                ? Colors.green
                                : task["status"] == "Canceled"
                                ? Colors.red
                                : Colors.greenAccent,),
                        child: Text(
                          task["status"],
                          style: myTextStyle.titleSmall,
                        ),
                      ),
                      Wrap(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_calendar,
                              size: 20.sp,
                              color: const Color(0xff76BBAA),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_forever,
                              size: 20.sp,
                              color: const Color(0xffF79293),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Gap(4.h),
        itemCount: taskList.length);
  }
}
