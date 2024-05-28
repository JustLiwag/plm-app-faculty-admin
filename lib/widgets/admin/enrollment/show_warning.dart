import 'package:flutter/material.dart';

void showWarningDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title:
            const Text("Warning", style: TextStyle(color: Color(0xFF006699))),
        content: Text(content, style: const TextStyle(color: Colors.black)),
        actions: <Widget>[
          TextButton(
            child: const Text("OK", style: TextStyle(color: Color(0xFF006699))),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
