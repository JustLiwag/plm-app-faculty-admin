import 'package:flutter/material.dart';
import 'package:mysample/screens/admin/enrollment/enrollment_container_screen.dart';
import '../../screens/admin/admission/admission.dart';
// import '../../screens/admin/enrollment/enrollment.dart';
import '../../screens/admin/announcement/announcement.dart';
import '../../screens/admin/sfe/sfe.dart';
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
    const Admission(),
    const Announcemnent(),
    EnrollmentContainerScreen(),
    const SFE(),
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
