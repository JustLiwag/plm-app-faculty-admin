import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: AppTheme.baseBlue,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppTheme.accentGold,
        unselectedItemColor: AppTheme.basewhite,
        onTap: onTap,
        type: BottomNavigationBarType.fixed, // Add this line
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
        selectedLabelStyle:
            const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Admission',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Announcement',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Enrollment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'SFE',
          ),
        ],
      ),
    );
  }
}
