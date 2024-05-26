import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Enrollment extends StatelessWidget {
  const Enrollment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Enrollment'),
      body: Center(
        child: Text(
          'Enrollment',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}