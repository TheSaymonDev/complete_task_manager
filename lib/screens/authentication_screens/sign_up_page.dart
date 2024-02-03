import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';

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

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": ""
  };
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _formValues["email"] = _emailController.text.trim();
      _formValues["firstName"] = _firstNameController.text.trim();
      _formValues["lastName"] = _lastNameController.text.trim();
      _formValues["mobile"] = _phoneController.text.trim();
      _formValues["password"] = _passwordController.text.trim();
      bool registrationSuccess = await registrationRequest(_formValues);
      if (registrationSuccess == true) {
        Get.offAll(const SignInPage());
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
                const AppInputTitleText(title: 'Your Email Address'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.mail_outline_sharp,
                  hintText: 'Enter your email address',
                  controller: _emailController,
                  validator: emailValidator,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your First Name'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.person,
                  hintText: 'Enter your first name',
                  controller: _firstNameController,
                  validator: nameValidator,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your Last Name'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.person,
                  hintText: 'Enter your last name',
                  controller: _lastNameController,
                  validator: nameValidator,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your Mobile Number'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.phone_android,
                  hintText: 'Enter your mobile number',
                  controller: _phoneController,
                  validator: phoneValidator,
                  keyboardType: TextInputType.phone,
                ),
                Gap(16.h),
                const AppInputTitleText(title: 'Your Password'),
                Gap(8.h),
                CustomTextFormField(
                  icon: Icons.key,
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: passwordValidator,
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
                        buttonName: 'Registration'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
