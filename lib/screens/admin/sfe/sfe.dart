import 'package:flutter/material.dart';
import 'package:mysample/screens/admin/sfe/Screens/homepage.dart';

class SFE extends StatelessWidget {
  const SFE({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: HomePage()),
        ],
      ),
    );
  }
}
