import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  const NavigationBarApp({super.key});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int _currentIndex = 0;
  List<Widget> _page = <Widget>[
    const Text('Schedule'),
    const Text('Teaching Assignment'),
    const Text('Class List & Grades'),
    const Text('Change Grades'),
    const Text('SFE Results'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Schedule', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
