import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Admission extends StatelessWidget {
  const Admission({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Admission'),
      body: Center(
        child: Text(
          'Admission',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
