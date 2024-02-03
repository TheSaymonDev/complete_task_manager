import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/styles.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:complete_task_manager/screens/authentication_screens/sign_in_page.dart';
import 'package:complete_task_manager/screens/profile_screen/update_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    super.key,
    this.firstName,
    this.lastName,
    this.email,
    this.photo,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? photo;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: cardColor,
      title: InkWell(
        onTap: () {
          Get.to(const UpdateProfilePage());
        },
        child: Row(
          children: [
            SizedBox(
              height: 44.h,
              width: 44.w,
              child: CircleAvatar(
                backgroundColor: buttonTextColor,
                foregroundImage: MemoryImage(showBase64Img(defaultPhotoPath)),
              ),
            ),
            Gap(8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$firstName $lastName',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '$email',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyColor),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              showDialogBox(
                  context: context,
                  title: 'Logout',
                  middleText: 'Are you sure want to logout?',
                  onPressedCancel: () {
                    Get.back();
                  },
                  onPressedConfirm: () {
                    logOut();
                    Get.offAll(() => const SignInPage());
                  });
            },
            icon: Icon(
              Icons.logout,
              size: 25.sp,
              color: buttonTextColor,
            )),
      ],
    );
  }
}
