import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
