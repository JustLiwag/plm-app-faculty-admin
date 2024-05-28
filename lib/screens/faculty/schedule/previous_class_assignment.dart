import 'package:flutter/material.dart';
import 'package:mysample/models/faculty/assignment_model.dart';
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
    final semesters = previousAssignments.map((e) => e.semester).toSet().toList();
    semesters.sort(); // Sort semesters if necessary
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006699),
        title: const Text(
          'Schedule',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  'AySem: ',
                  style: TextStyle(
                    color: Color(0xFFA31920),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButton<String>(
                  value: _selectedSemester,
                  items: uniqueSemesters
                      .map((semester) => DropdownMenuItem(
                            value: semester,
                            child: Text(semester, style: const TextStyle(fontSize: 12)),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedSemester = value;
                    });
                  },
                  hint: const Padding(
                    padding: EdgeInsets.zero,
                    child: Text('Select Semester', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 30,
                width: 80,
                child: ElevatedButton(
                  onPressed: _search,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA31920),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
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
                  child: Text(
                    _selectedSemester ?? 'No semester selected',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (_selectedSemester != null)
                  AssignmentTable(assignments: _filteredAssignments, semesterTitle: _selectedSemester!),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
