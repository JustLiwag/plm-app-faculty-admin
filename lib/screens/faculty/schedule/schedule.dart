import 'package:flutter/material.dart';
import 'package:mysample/screens/faculty/schedule/previous_class_assignment.dart';
import 'package:mysample/utils/app_styles.dart';
import '../../../data/faculty/assignment_data.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  int _calculateTotalCredits() {
    int totalCredits = 0;
    for (var assignment in assignments) {
      totalCredits += int.parse(assignment.credits);
    }
    return totalCredits;
  }

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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        '2ND SEMESTER SY 2023-2024',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(20.0),
                        1: FlexColumnWidth(30.0),
                        2: FlexColumnWidth(25.0),
                        3: FixedColumnWidth(85.0),
                        4: FlexColumnWidth(15.0),
                      },
                      children: [
                        TableRow(
                          children: [
                            _buildTableHeader('Class Code'),
                            _buildTableHeader('Course Code & Section'),
                            _buildTableHeader('Course Title'),
                            _buildTableHeader('Class Schedule'),
                            _buildTableHeader('Credits'),
                          ],
                        ),
                        for (var assignment in assignments)
                          TableRow(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            children: [
                              _buildTableCell(assignment.classCode),
                              _buildTableCell(assignment.courseCodeSection),
                              _buildTableCell(assignment.courseTitle),
                              _buildTableCellWithLines(
                                _formatClassSchedule(assignment.classSchedule),
                              ),
                              _buildTableCell(assignment.credits),
                            ],
                          ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Center(
                        child: Text(
                          '-------------------NO ENTRY FOLLOWS-------------------',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'Total Credits: ${_calculateTotalCredits()}',
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
              ),
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

  Widget _buildTableHeader(String text) {
    return TableCell(
      child: Container(
        height: 60,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTableCellWithLines(List<String> lines) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: lines
              .map((line) => Text(
                    line,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ))
              .toList(),
        ),
      ),
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
        } else if (currentLine.contains(RegExp(r'[a-zA-Z]')) &&
            !part.contains(RegExp(r'[a-zA-Z]'))) {
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
