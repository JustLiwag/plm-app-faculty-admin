import 'package:flutter/material.dart';
import '../../../data/faculty/assignment_data.dart';
import '../../../models/faculty/assignment_model.dart';

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

  int _calculateTotalCredits() {
    int totalCredits = 0;
    for (var assignment in _filteredAssignments) {
      totalCredits += int.parse(assignment.credits);
    }
    return totalCredits;
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FixedColumnWidth(150.0),
                  4: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: const BoxDecoration(color: Color(0xFFFFC909)),
                    children: [
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Class Code',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Course Code & Section',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Course Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Class Schedule',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Credits',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var assignment in _filteredAssignments)
                    TableRow(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(179, 240, 231, 231)),
                      children: [
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment.classCode,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment.courseCodeSection,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment.courseTitle,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _formatClassSchedule(
                                assignment.classSchedule,
                              )
                                  .map((line) => Text(
                                        line,
                                        style: const TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment.credits,
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  TableRow(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFC909),
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            '',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            '',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            '',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Total Credits',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            _calculateTotalCredits().toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  List<String> _formatClassSchedule(String schedule) {
    List<String> parts = schedule.split(' ');
    if (parts.length == 4) {
      return parts;
    } else {
      List<String> formatted = [];
      String currentLine = '';
      for (String part in parts) {
        if (currentLine.isEmpty) {
          currentLine = part;
        } else if (currentLine.contains(RegExp(r'[a-zA-Z]')) && !part.contains(RegExp(r'[a-zA-Z]'))) {
          currentLine += ' $part';
        } else {
          formatted.add(currentLine);
          currentLine = part;
        }
      }
      if (currentLine.isNotEmpty) {
        formatted.add(currentLine);
      }
      return formatted;
    }
  }
}
