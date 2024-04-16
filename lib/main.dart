import 'package:flutter/material.dart';
import 'package:mysample/screens/faculty/onboarding/onboarding_faculty.dart';
import 'package:mysample/widgets/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Center(
        child: NavigationBarApp(),
      ),
    );
  }
}
