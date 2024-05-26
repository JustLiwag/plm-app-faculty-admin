import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule'),
      body: Center(
        child: Text(
          'Schedule',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
