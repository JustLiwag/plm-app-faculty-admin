import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class SFEResults extends StatelessWidget {
  const SFEResults({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'SFE Results'),
      body: Center(
        child: Text(
          'SFE Results',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
