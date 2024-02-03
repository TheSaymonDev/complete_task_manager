import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/validators.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_drop_down_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_text_form_field.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:complete_task_manager/screens/home_screen/home_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<String> _statusList = ['New', 'Completed', 'Canceled', 'Progress'];
  String _selectedStatus = '';

  final Map<String, String> _formValues = {
    "title": "",
    "description": "",
    "status": "",
  };
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues["title"] = _titleController.text.trim();
      _formValues["description"] = _desController.text.trim();
      _formValues["status"] = _selectedStatus;
      bool createTaskSuccess = await createTaskRequest(_formValues);
      if (createTaskSuccess == true) {
        Get.off((const HomePage()));
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Container(
      height: 700.h,
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16.h),
              Text(
                'Add New Task',
                style: myTextStyle.titleLarge,
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your Task Subject'),
              Gap(8.h),
              CustomTextFormField(
                icon: Icons.subject,
                hintText: 'Enter your task subject',
                controller: _titleController,
                validator: nameValidator,
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Your Task Description'),
              Gap(8.h),
              SizedBox(
                height: 150.h,
                width: double.infinity.w,
                child: TextFormField(
                  cursorColor: buttonTextColor,
                  maxLines: 8,
                  style: myTextStyle.bodyMedium,
                  controller: _desController,
                  validator: desValidator,
                  decoration: InputDecoration(
                    hintText: 'Enter your task description',
                    hintStyle:
                        myTextStyle.bodyMedium!.copyWith(color: greyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.r),
                      borderSide: const BorderSide(color: greyColor, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.r),
                      borderSide: const BorderSide(color: greyColor, width: 1),
                    ),
                  ),
                ),
              ),
              Gap(16.h),
              const AppInputTitleText(title: 'Choose your status'),
              Gap(8.h),
              CustomDropdownButton(
                items: _statusList,
                onChanged: (newValue) {
                  setState(() {
                    _selectedStatus = newValue!;
                  });
                },
                labelText: 'Select Status',
              ),
              Gap(30.h),
              isLoading == true
                  ? Center(
                      child: customCircularProgressIndicator,
                    )
                  : CustomBlueElevatedButton(
                      onPressed: () {
                        _formOnSubmit();
                      },
                      buttonName: 'Add'),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
