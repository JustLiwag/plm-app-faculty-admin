import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class ChangeGrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
