import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class ChangeGrades extends StatelessWidget {
  const ChangeGrades({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Change Grades'),
      body: Center(
        child: Text(
          'Change Grades',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
