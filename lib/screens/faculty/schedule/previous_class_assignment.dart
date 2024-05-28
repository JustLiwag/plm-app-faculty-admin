import 'package:flutter/material.dart';

class PreviousClassAssignmentPage extends StatefulWidget {
  @override
  _PreviousClassAssignmentPageState createState() =>
      _PreviousClassAssignmentPageState();
}

class _PreviousClassAssignmentPageState
    extends State<PreviousClassAssignmentPage> {
  String? _selectedSemester;
  List<Map<String, String>> _filteredAssignments = [];

  final List<Map<String, String>> previousAssignments = [
    //1st
    {
      'classCode': '10001',
      'courseCodeSection': 'CFS 0001',
      'courseTitle': 'Elective 1 (LEC)',
      'classSchedule': 'M 9:30a-12:30p F2F GC 201',
      'credits': '2',
      'semester': '1st SEMESTER SY 2010-2011',
    },
    {
      'classCode': '10002',
      'courseCodeSection': 'CFS 0002',
      'courseTitle': 'Elective 1 (LAB)',
      'classSchedule': 'T 9:30a-12:30p F2F GC 201',
      'credits': '1',
      'semester': '1st SEMESTER SY 2010-2011',
    },
    //2nd
    {
      'classCode': '10001',
      'courseCodeSection': 'CFS 0001',
      'courseTitle': 'Elective 1 (LAB)',
      'classSchedule': 'M 1:30p-4:30p F2F GC 202',
      'credits': '1',
      'semester': '2nd SEMESTER SY 2010-2011',
    },
    {
      'classCode': '10002',
      'courseCodeSection': 'CFS 0002',
      'courseTitle': 'Elective 1 (LEC)',
      'classSchedule': 'T 9:30a-12:30p F2F GC 203',
      'credits': '2',
      'semester': '2nd SEMESTER SY 2010-2011',
    },
    {
      'classCode': '10003',
      'courseCodeSection': 'CFS 0003',
      'courseTitle': 'OOP (LAB)',
      'classSchedule': 'W 9:30a-12:30p F2F GC 203',
      'credits': '1',
      'semester': '2nd SEMESTER SY 2010-2011',
    },
    {
      'classCode': '10004',
      'courseCodeSection': 'CFS 0003',
      'courseTitle': 'OOP (LEC)',
      'classSchedule': 'TH 9:30a-12:30p F2F GC 203',
      'credits': '2',
      'semester': '2nd SEMESTER SY 2010-2011',
    },
    //1st
    {
      'classCode': '10001',
      'courseCodeSection': 'CFS 0001',
      'courseTitle': 'SE 1 (LAB)',
      'classSchedule': 'T 1:30p-4:30p F2F GC 202',
      'credits': '1',
      'semester': '1st SEMESTER SY 2011-2012',
    },
    {
      'classCode': '10002',
      'courseCodeSection': 'CFS 0002',
      'courseTitle': 'SE 1 (LEC)',
      'classSchedule': 'T 9:30a-12:30p F2F GC 203',
      'credits': '2',
      'semester': '1st SEMESTER SY 2011-2012',
    },
    {
      'classCode': '10003',
      'courseCodeSection': 'CFS 0003',
      'courseTitle': 'Automata (LAB)',
      'classSchedule': 'W 9:30a-12:30p F2F GC 203',
      'credits': '1',
      'semester': '1st SEMESTER SY 2011-2012',
    },
    {
      'classCode': '10004',
      'courseCodeSection': 'CFS 0003',
      'courseTitle': 'Automata (LEC)',
      'classSchedule': 'W 9:30a-12:30p F2F GC 203',
      'credits': '2',
      'semester': '1st SEMESTER SY 2011-2012',
    },
  ];

  void _search() {
    if (_selectedSemester != null) {
      setState(() {
        _filteredAssignments = previousAssignments
            .where((assignment) => assignment['semester'] == _selectedSemester)
            .toList();
      });
    }
  }

  int _calculateTotalCredits() {
    int totalCredits = 0;
    for (var assignment in _filteredAssignments) {
      totalCredits += int.parse(assignment['credits'] ?? '0');
    }
    return totalCredits;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006699),
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
        SizedBox(height: 40),
        Text(
          'PREVIOUS CLASS ASSIGNMENT',
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Padding(
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
                items: [
                  DropdownMenuItem(
                    value: '1st SEMESTER SY 2010-2011',
                    child: Text('1st SEMESTER SY 2010-2011',
                        style: TextStyle(fontSize: 12)),
                  ),
                  DropdownMenuItem(
                    value: '2nd SEMESTER SY 2010-2011',
                    child: Text('2nd SEMESTER SY 2010-2011',
                        style: TextStyle(fontSize: 12)),
                  ),
                  DropdownMenuItem(
                    value: '1st SEMESTER SY 2011-2012',
                    child: Text('1st SEMESTER SY 2011-2012',
                        style: TextStyle(fontSize: 12)),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    _selectedSemester = value;
                  });
                },
                hint: Padding(
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              height: 30,
              width: 80,
              child: ElevatedButton(
                onPressed: _search,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA31920),
                ),
                child: Text(
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
                color: Color.fromARGB(179, 240, 231, 231),
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  _selectedSemester ?? 'No semester selected',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color(0xFFFFC909)),
                    children: [
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                      decoration: BoxDecoration(
                          color: Color.fromARGB(179, 240, 231, 231)),
                      children: [
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment['classCode'] ?? '',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment['courseCodeSection'] ?? '',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment['courseTitle'] ?? '',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              assignment['classSchedule'] ?? '',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              assignment['credits'] ?? '',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFC909),
                    ),
                    children: [
                      TableCell(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            _calculateTotalCredits().toString(),
                            style: TextStyle(
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
}
