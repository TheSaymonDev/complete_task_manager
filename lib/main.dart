import 'package:complete_task_manager/reusables/theme.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:complete_task_manager/screens/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:complete_task_manager/screens/onboarding_screen/splash_screen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData('token');
  runApp(
    MyApp(
      screen:
          token != null ? const HomePage() : const SplashScreenPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.screen});

  final Widget? screen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customThemeStyle,
          home: child,
        );
      },
      child: screen,
    );
  }
}
