import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/widgets/custom_task_listview.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {

  List taskCountItem = [];
  bool isLoading = true;
  List taskItem = [];

  _callData() async {
    taskItem = await taskListRequest("New");
    taskCountItem = await taskCountListRequest();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _callData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Gap(16.h),
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    taskCountItem.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: 80.w,
                        decoration: decorationStyle(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskCountItem[index]["sum"].toString(),
                              style: myTextStyle.titleLarge,
                            ),
                            Text(
                              taskCountItem[index]["_id"],
                              style: myTextStyle.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Gap(16.h),
          Expanded(
            child: isLoading == true
                ? customCircularProgressIndicator
                : RefreshIndicator(
                    child: CustomTaskListView(taskList: taskItem),
                    onRefresh: () async {
                      await _callData();
                    }),
          ),
        ],
      ),
    );
  }
}
