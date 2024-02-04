import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_drop_down_button.dart';
import 'package:complete_task_manager/screens/home_screen/home_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomTaskListView extends StatefulWidget {
  const CustomTaskListView({super.key, required this.taskList});

  final List taskList;

  @override
  State<CustomTaskListView> createState() => _CustomTaskListViewState();
}

class _CustomTaskListViewState extends State<CustomTaskListView> {

  final List<String> _statusList = [
    'New',
    'Completed',
    'Cancelled',
    'Progress'
  ];
  String? _selectedStatus = '';

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return ListView.separated(
        itemBuilder: (context, index) {
          final task = widget.taskList[index];
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
                                      : Colors.greenAccent,
                        ),
                        child: Text(
                          task["status"],
                          style: myTextStyle.titleSmall,
                        ),
                      ),
                      Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.bottomSheet(Container(
                                width: double.infinity.w,
                                color: backgroundColor,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  children: [
                                    Gap(32.h),
                                    CustomDropdownButton(
                                      items: _statusList,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedStatus = newValue!;
                                        });
                                      },
                                      labelText: 'Select Status',
                                    ),
                                    Gap(16.h),
                                    CustomBlueElevatedButton(onPressed: ()async{
                                      bool updateSuccess = await taskUpdateRequest(task["_id"], _selectedStatus );
                                      if (updateSuccess == true) {
                                        Get.offAll(const HomePage());
                                      }
                                    }, buttonName: 'Update'),
                                    Gap(32.h),
                                  ],
                                ),
                              ));
                            },
                            icon: Icon(
                              Icons.edit_calendar,
                              size: 20.sp,
                              color: const Color(0xff76BBAA),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialogBox(
                                  context: context,
                                  title: 'Delete',
                                  middleText:
                                      'Are you sure want to delete task?',
                                  onPressedCancel: () {
                                    Get.back();
                                  },
                                  onPressedConfirm: () async {
                                    bool deleteSuccess =
                                        await taskDeleteRequest(task["_id"]);
                                    if (deleteSuccess == true) {
                                      Get.offAll(const HomePage());
                                    }
                                  });
                            },
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
        itemCount: widget.taskList.length);
  }
}
