import 'package:flutter/material.dart';

class AppTheme {
  static const Color baseBlack = Color(0xFF000000);
  static const Color baseGrey = Color(0xFF545454);
  static const Color baseBlue = Color(0xFF006699);
  static const Color basewhite = Color(0xFFFFFFFF);
  static const Color baseGold = Color(0xFFEAB700);
  static const Color accentGold = Color(0xFFFFC909);
  static const Color baseRed = Color(0xFFA31920);
}

String token = '';

/// Colors
const primary = Color(0xFF006699);
const onPrimary = Color(0xFFFFF5D1);
const secondary = Color(0xFFFFC909);
const onSecondary = Color(0xFFFFC909);
const error = Color(0xFFA31920);
const onError = Color(0xFFA31920);
const background = Colors.white;
// const onBackground = Colors.grey.shade700;
// onBackground: ,
// surface: Colors.white,
// onSurface: Colors.grey.shade800

class CustomTitleHead extends StatelessWidget {
  final String text;

  CustomTitleHead({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppTheme.basewhite,
      ),
    );
  }
}

class CustomSubText extends StatelessWidget {
  final String text;

  CustomSubText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        color: AppTheme.baseBlack,
      ),
    );
  }
}
