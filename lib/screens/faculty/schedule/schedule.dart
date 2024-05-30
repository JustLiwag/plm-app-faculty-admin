import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/faculty/schedule/previous_class_assignment.dart';
import '../../../data/faculty/assignment_data.dart';
import '../../../widgets/faculty/assignment_table.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Schedule'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'CURRENT CLASS ASSIGNMENT',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              AssignmentTable(assignments: assignments, semesterTitle: '2ND SEMESTER SY 2023-2024'),
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 16),
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF006699),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreviousClassAssignmentPage(),
                  ),
                );
              },
              child: const Icon(Icons.history, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
