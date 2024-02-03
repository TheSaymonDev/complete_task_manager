import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:complete_task_manager/reusables/validators.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_text_form_field.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_in_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? email;
  String? otp;

  final Map<String, String> _formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cPassword": ""
  };
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues["email"] = email!;
      _formValues["OTP"] = otp!;
      _formValues["password"] = _newPasswordController.text.trim();
      bool setPasswordSuccess = await setPasswordRequest(_formValues);
      if (setPasswordSuccess == true) {
        Get.offAll(const SignInPage());
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _callStoreData();
  }

  void _callStoreData() async {
    email = await readUserData('verifyEmail');
    otp = await readUserData('otp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            size: 24.sp,
            color: buttonTextColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(const SignInPage());
            },
            child: Text(
              'Sign In',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppInputTitleText(title: 'Your Password'),
                Gap(8.h),
                CustomTextFormField(
                  controller: _newPasswordController,
                  icon: Icons.key,
                  hintText: 'Enter your password',
                  validator: passwordValidator,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your Confirm Password'),
                Gap(8.h),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  icon: Icons.key,
                  hintText: 'Enter your confirm password',
                  validator: (value) =>
                      confirmPasswordValidator(value, _newPasswordController),
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
                        buttonName: 'Confirm'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
