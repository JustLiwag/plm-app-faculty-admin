import 'package:flutter/material.dart';
import 'package:mysample/screens/admin/onboarding/onboarding_admin.dart';
// ignore: unused_import
import 'package:mysample/screens/faculty/onboarding/onboarding_faculty.dart';
// import 'bottom_navigation.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
// import 'package:mysample/widgets/base_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: AppTheme.baseBlue,
        ),
        home: const SafeArea(child: OnBoardingAdmin()),
      );
    }
}
