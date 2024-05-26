import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class SFE extends StatelessWidget {
  const SFE({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Student Faculty Evaluation'),
      body: Center(
        child: Text(
          'Student Faculty Evaluation',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
