import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigation({required this.currentIndex, required this.onTap});

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
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Assignment',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Classlist',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Change Grades',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'SFE',
          ),
        ],
      ),
    );
  }
}
