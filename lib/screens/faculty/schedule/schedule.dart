import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Schedule extends StatelessWidget {
  Schedule({super.key});

  final List<Map<String, String>> currentAssignments = [
    {
      'classCode': '10001',
      'courseCodeSection': 'CFS 0001',
      'courseTitle': 'Elective 1 (LEC)',
      'classSchedule': 'M 9:30a-12:30p F2F GC 201',
      'credits': '2'
    },
    {
      'classCode': '10002',
      'courseCodeSection': 'CFS 0002',
      'courseTitle': 'Elective 1 (LAB)',
      'classSchedule': 'T 1:30p-4:30p F2F GC 202',
      'credits': '1'
    },
    {
      'classCode': '10003',
      'courseCodeSection': 'CFS 0003',
      'courseTitle': 'OOP (LEC)',
      'classSchedule': 'W 9:30a-12:30p F2F GC 203',
      'credits': '2'
    },
  ];

  int _calculateTotalCredits() {
    int totalCredits = 0;
    for (var assignment in currentAssignments) {
      totalCredits += int.parse(assignment['credits'] ?? '0');
    }
    return totalCredits;
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Schedule'),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: [
                  TableRow(
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
                              color: Colors.blue,
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
                              color: Colors.blue,
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
                              color: Colors.blue,
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
                              color: Colors.blue,
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
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  for (var assignment in currentAssignments)
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      children: [
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment['classCode'] ?? '',
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
                              assignment['courseCodeSection'] ?? '',
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
                              assignment['courseTitle'] ?? '',
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
                            child: Text(
                              assignment['classSchedule'] ?? '',
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
                              assignment['credits'] ?? '',
                              style: const TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
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
      ]),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.only(right: 10, bottom: 16),
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF006699),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PreviousClassAssignmentPage(),
              //   ),
              // );
            },
            child: const Icon(Icons.history, color: Colors.white),
          ),
        ),
      ),
      ),
    );
  }
}
