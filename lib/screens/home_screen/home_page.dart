import 'package:complete_task_manager/reusables/colors.dart';
import 'package:complete_task_manager/reusables/utility.dart';
import 'package:complete_task_manager/screens/home_screen/home_page_components/my_appbar.dart';
import 'package:complete_task_manager/screens/home_screen/home_page_components/my_bottom_nav_bar.dart';
import 'package:complete_task_manager/screens/create_task_screen/create_task_page.dart';
import 'package:complete_task_manager/screens/task_screens/canceled_task_page.dart';
import 'package:complete_task_manager/screens/task_screens/completed_task_page.dart';
import 'package:complete_task_manager/screens/task_screens/new_task_page.dart';
import 'package:complete_task_manager/screens/task_screens/progress_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pageList = [
    const NewTaskPage(),
    const CompletedTaskPage(),
    const CanceledTaskPage(),
    const ProgressTaskPage()
  ];

  void _onTap(int index){
    _currentIndex= index;
    setState(() {
    });
  }

  final Map<String, String> _formValues = {"email": "", "firstName": "", "lastName": "", "photo": ""};

  @override
  void initState(){
    _readMyData();
    super.initState();
  }

  void _readMyData() async {
    _formValues["email"] = (await readUserData('email'))!;
    _formValues["firstName"] = (await readUserData('firstName'))!;
    _formValues["lastName"] = (await readUserData('lastName'))!;
    _formValues["photo"] = (await readUserData('photo'))!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(currentIndex: _currentIndex, onTap: _onTap,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.bottomSheet(
           const CreateTaskPage(),
          );
        },
        child: Icon(
          Icons.add,
          color: buttonTextColor,
          size: 24.sp,
        ),
      ),
      appBar: MyAppbar(firstName: _formValues["firstName"], lastName: _formValues["lastName"], email: _formValues["email"], photo: _formValues["photo"]),
      body: _pageList.elementAt(_currentIndex),
    );
  }
}
