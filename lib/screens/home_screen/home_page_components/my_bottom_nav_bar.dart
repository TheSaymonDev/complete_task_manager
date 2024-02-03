import 'package:complete_task_manager/reusables/colors.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: cardColor,
      selectedItemColor: buttonTextColor,
      unselectedItemColor: greyColor,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.file_copy), label: 'New Task'),
        BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_rounded), label: 'Completed'),
        BottomNavigationBarItem(
            icon: Icon(Icons.cancel_rounded), label: 'Canceled'),
        BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle), label: 'Progress'),
      ],
    );
  }
}
