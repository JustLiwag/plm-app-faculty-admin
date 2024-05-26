import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Classlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Classlist Report of Grades'),
      body: Center(
        child: Text(
          'Classlist Report of Grades',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
