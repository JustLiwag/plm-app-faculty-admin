import 'package:flutter/material.dart';
import 'package:mysample/screens/faculty/sfe_results/Screens/faculty.dart';

class SFEResults extends StatelessWidget {
  const SFEResults({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: FacultyScreen()),
        ],
      ),
    );
  }
}
