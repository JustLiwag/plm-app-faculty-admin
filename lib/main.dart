import 'package:flutter/material.dart';
import 'package:mysample/screens/faculty/onboarding/onboarding_faculty.dart';
import 'bottom_navigation.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/base_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: AppTheme.baseBlue,
      ),
      home: OnBoardingFaculty(),
    );
  }
}
