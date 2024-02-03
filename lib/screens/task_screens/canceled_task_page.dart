import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/widgets/custom_task_listview.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CanceledTaskPage extends StatefulWidget {
  const CanceledTaskPage({super.key});

  @override
  State<CanceledTaskPage> createState() => _CanceledTaskPageState();
}

class _CanceledTaskPageState extends State<CanceledTaskPage> {

  bool isLoading = true;
  List taskItem = [];

  _callData() async {
    taskItem = await taskListRequest("Canceled");
    if(mounted){
      setState(() {isLoading = false;});
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
