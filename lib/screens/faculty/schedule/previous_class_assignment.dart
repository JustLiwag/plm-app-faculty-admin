import 'package:flutter/material.dart';
import 'package:mysample/models/faculty/assignment_model.dart';
import 'package:mysample/utils/app_styles.dart';
import '../../../data/faculty/assignment_data.dart';
import '../../../widgets/faculty/assignment_table.dart';

class PreviousClassAssignmentPage extends StatefulWidget {
  const PreviousClassAssignmentPage({super.key});

  @override
  PreviousClassAssignmentPageState createState() =>
      PreviousClassAssignmentPageState();
}

class PreviousClassAssignmentPageState
    extends State<PreviousClassAssignmentPage> {
  String? _selectedSemester;
  List<Assignment> _filteredAssignments = [];

  @override
  void initState() {
    super.initState();
    _filteredAssignments = previousAssignments;
  }

  List<String> _getUniqueSemesters() {
    final semesters =
        previousAssignments.map((e) => e.semester).toSet().toList();
    semesters.sort();
    return semesters;
  }

  void _search() {
    if (_selectedSemester != null) {
      setState(() {
        _filteredAssignments = previousAssignments
            .where((assignment) => assignment.semester == _selectedSemester)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final uniqueSemesters = _getUniqueSemesters();

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Previous Class Assignment'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'PREVIOUS CLASS ASSIGNMENT',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 60, right: 10),
                    child: Text(
                      'AYSem: ',
                      style: TextStyle(
                        color: Color(0xFFA31920),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: _selectedSemester,
                        items: uniqueSemesters
                            .map((semester) => DropdownMenuItem(
                                  value: semester,
                                  child: Text(semester,
                                      style: const TextStyle(fontSize: 12)),
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          _search();
                          setState(() {
                            _selectedSemester = value;
                          });
                        },
                        hint: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Select Semester',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: const Color.fromARGB(179, 240, 231, 231),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Semester',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (_selectedSemester != null)
                      AssignmentTable(
                          assignments: _filteredAssignments,
                          semesterTitle: _selectedSemester!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
