import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Announcemnent extends StatelessWidget {
  const Announcemnent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Announcement'),
      body: Center(
        child: Text(
          'Announcement',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
