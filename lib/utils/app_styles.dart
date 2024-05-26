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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppTheme.basewhite,
        ),
      ),
      centerTitle: true,
      elevation: 0, // Removes the shadow under the AppBar
      iconTheme: const IconThemeData(color: AppTheme.basewhite),
      backgroundColor: AppTheme.baseBlue, // Makes the AppBar transparent
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); // Sets the height of the AppBar to the standard height
}

class CustomSubText extends StatelessWidget {
  final String text;

  const CustomSubText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        color: AppTheme.baseBlack,
      ),
    );
  }
}
