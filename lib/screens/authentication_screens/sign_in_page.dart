import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/validators.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/custom_text_form_field.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:complete_task_manager/screens/authentication_screens/forgot_password_page.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_up_page.dart';
import 'package:complete_task_manager/screens/home_screen/home_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formValues = {"email": "", "password": ""};
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues["email"] = _emailController.text.trim();
      _formValues["password"] = _passwordController.text.trim();
      bool loginSuccess = await logInRequest(_formValues);
      if (loginSuccess == true) {
        Get.offAll(const HomePage());
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
                Get.to(const SignUpPage());
              },
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.titleMedium,
              ))
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
                const AppInputTitleText(title: 'Your Email Address'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.mail_outline_sharp,
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: emailValidator,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your Password'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.key,
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  // validator: passwordValidator,
                ),
                Gap(30.h),
                isLoading == true
                    ? Center(
                        child: customCircularProgressIndicator)
                    : CustomBlueElevatedButton(
                        onPressed: () {
                          _formOnSubmit();
                        },
                        buttonName: 'Login',
                      ),
                Gap(24.h),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Get.to(const ForgotPasswordPage());
                    },
                    child: Text(
                      'Forgot Your Password?',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
