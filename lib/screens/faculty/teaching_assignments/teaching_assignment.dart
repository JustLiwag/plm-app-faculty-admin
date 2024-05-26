import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class TeachingAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Teaching Assignment'),
      body: Center(
        child: Text(
          'Teaching Assignment',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
