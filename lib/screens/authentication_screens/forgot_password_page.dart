import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/validators.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_text_form_field.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_in_page.dart';
import 'package:complete_task_manager/screens/authentication_screens/verification_code_input_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _email = "";
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _email = _emailController.text.trim();
      bool verifyEmailSuccess = await verifyEmailRequest(_email);
      if (verifyEmailSuccess == true) {
        Get.offAll(const VerificationCodeInputPage());
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
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
                Text(
                  'Your Email Address',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gap(16.h),
                const AppInputTitleText(
                    title:
                        'A 6 digit verification will send to your email address'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.mail_outline_sharp,
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: emailValidator,
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
                        buttonName: 'Next'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
