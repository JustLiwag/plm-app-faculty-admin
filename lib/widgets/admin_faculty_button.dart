// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';

class ButtonFill extends StatelessWidget {
  String buttonText;
  Color color, bgColor;
  void Function()? onPressed;

  ButtonFill({
    Key? key,
    required this.buttonText,
    this.color = Colors.black,
    this.bgColor = const Color(0XFF006699),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: bgColor,
            elevation: 5,
            fixedSize: Size(screenWidth * 90, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  String buttonText;
  Color color;
  void Function()? onPressed;

  ButtonOutline({
    Key? key,
    required this.buttonText,
    this.color = Colors.black,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0XFF006699),
            side: BorderSide(color: color),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            elevation: 5,
            fixedSize: Size(screenWidth * 90, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  ButtonIcon(
      {Key? key,
      required this.buttonName,
      required this.icon,
      required this.onPressed});

  String buttonName;
  IconData icon;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(80, 85),
        shape: CircleBorder(),
        padding: EdgeInsets.all(5),
        elevation: 0,
        // backgroundColor: Theme.of(context).colorScheme.secondary, // <-- Button color
        foregroundColor: const Color(0XFF006699), // <-- Splash color
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
            height: 40, width: 40, child: Center(child: Icon(icon, size: 26))),
        SizedBox(height: 3.0),
        Text(buttonName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: const Color(0XFF006699))),
      ]),
    );
  }
}

class ButtonText extends StatelessWidget {
  ButtonText(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed});

  Widget text;
  IconData icon;
  void Function()? onPressed;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: AppTheme.baseGrey,
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ]),
      child: Center(
        child: TextButton(
            style: flatButtonStyle,
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text,
                        CircleAvatar(
                          radius: 16.0,
                          backgroundColor: const Color(0XFF006699),
                          child: Icon(
                            icon,
                            size: 15,
                            color: AppTheme.basewhite,
                          ),
                        ),
                      ]),
                ],
              ),
            )),
      ),
    );
  }
}
