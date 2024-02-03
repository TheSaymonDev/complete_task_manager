import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/widgets/custom_task_listview.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedTaskPage extends StatefulWidget {
  const CompletedTaskPage({super.key});

  @override
  State<CompletedTaskPage> createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  bool isLoading = true;
  List taskItem = [];

  _callData() async {
    taskItem = await taskListRequest("Completed");
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
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: isLoading == true
          ? customCircularProgressIndicator
          : RefreshIndicator(
              child: CustomTaskListView(taskList: taskItem),
              onRefresh: () async {
                await _callData();
              }),
    );
  }
}
