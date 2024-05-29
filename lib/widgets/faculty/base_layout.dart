import 'package:flutter/material.dart';
import 'package:mysample/screens/faculty/change_grades/grades_login.dart';
import 'package:mysample/screens/faculty/classlist/classlist_report_of_grades.dart';
import 'package:mysample/screens/faculty/sfe_results/sfe_results.dart';
import 'package:mysample/screens/faculty/schedule/schedule.dart';
import 'package:mysample/screens/faculty/teaching_assignments/teaching_assignment.dart';
import 'package:mysample/models/faculty/subject_model.dart';
import 'package:mysample/data/faculty/subject_data.dart';
import 'bottom_navigation.dart';

class BaseLayoutPage extends StatefulWidget {
  final int initialIndex;
  const BaseLayoutPage({super.key, this.initialIndex = 0});

  @override
  State<BaseLayoutPage> createState() => _BaseLayoutPageState();
}

class _BaseLayoutPageState extends State<BaseLayoutPage> {
  int _selectedIndex = 0;

  final List<Subject> _subjects = subjectList;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pages = [
      const Schedule(),
      const TeachingAssignmentsPage(),
      Classlist(subjects: _subjects), // Pass subjects to Classlist
      const GradesLoginPage(),
      const SFEResults(),
    ];
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
