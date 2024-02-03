import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:complete_task_manager/reusables/validators.dart';
import 'package:complete_task_manager/reusables/widgets/custom_blue_elevated_button.dart';
import 'package:complete_task_manager/reusables/widgets/app_input_title_text.dart';
import 'package:complete_task_manager/screens/authentication_screens/set_password_page.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_in_page.dart';
import 'package:complete_task_manager/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeInputPage extends StatefulWidget {
  const VerificationCodeInputPage({super.key});

  @override
  State<VerificationCodeInputPage> createState() =>
      _VerificationCodeInputPageState();
}

class _VerificationCodeInputPageState extends State<VerificationCodeInputPage> {
  final _pinCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _otp = "";
  bool isLoading = false;
  void _formOnSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });
      _otp = _pinCodeController.text.trim();
      String? email = await readUserData('verifyEmail');
      bool verifyPinCodeSuccess = await verifyPinCodeRequest(email, _otp);
      if (verifyPinCodeSuccess == true) {
        Get.offAll(const SetPasswordPage());
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
                  'Pin Verification',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Gap(16.h),
                const AppInputTitleText(
                    title:
                        'A 6 - Digit PIN has been sent to your email address, enter it below to continue'),
                Gap(8.h),
                PinCodeTextField(
                  controller: _pinCodeController,
                  validator: pinValidator,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  pinTheme: pinTheme(),
                  onCompleted: (v) {},
                  onChanged: (value) {},
                ),
                Gap(30.h),
                isLoading == true ? Center(child: customCircularProgressIndicator,):CustomBlueElevatedButton(
                  onPressed: () {
                    _formOnSubmit();
                  },
                  buttonName: 'Verify',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
