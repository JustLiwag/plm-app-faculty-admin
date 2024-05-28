import 'package:flutter/material.dart';
import '../../screens/faculty/change_grades/change_grades.dart';
import '../../screens/faculty/classlist_report_of_grades/classlist_report_of_grades.dart';
import '../../screens/faculty/sfe_results/sfe_results.dart';
import '../../screens/faculty/schedule/schedule.dart';
import '../../screens/faculty/teaching_assignments/teaching_assignment.dart';
// import 'package:mysample/utils/app_styles.dart';
import 'bottom_navigation.dart';

class BaseLayoutPage extends StatefulWidget {
  final int initialIndex;
  const BaseLayoutPage({super.key, this.initialIndex = 0});

  @override
  State<BaseLayoutPage> createState() => _BaseLayoutPageState();
}

class _BaseLayoutPageState extends State<BaseLayoutPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Schedule(),
    const TeachingAssignment(),
    const Classlist(),
    const ChangeGrades(),
    const SFEResults(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigation(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
