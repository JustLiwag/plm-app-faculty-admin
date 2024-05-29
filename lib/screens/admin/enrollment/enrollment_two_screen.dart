import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mysample/data/admin/student_data.dart';
import 'package:mysample/models/admin/student_model.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import '../../../core/app_export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class StudentDataSource extends DataTableSource {
  final List<Student> students;
  final Function(Student) onSelect;

  StudentDataSource({required this.students, required this.onSelect});

  @override
  DataRow getRow(int index) {
    final student = students[index];
    return DataRow(cells: [
      DataCell(Text(student.number)),
      DataCell(
        InkWell(
          onTap: () => onSelect(student),
          child: SizedBox(
            width: 150.0,
            child: Text(
              student.name,
              style: const TextStyle(fontSize: 14, height: 1.2),
              softWrap: true,
              overflow: TextOverflow.visible,
              maxLines: 3,
            ),
          ),
        ),
      ),
      DataCell(
        Text(
          student.status,
          style: TextStyle(
            fontSize: 14,
            color: student.status == "Enrolled" ? Colors.blue : Colors.red,
          ),
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => students.length;
  @override
  int get selectedRowCount => 0;
}

class EnrollmentTwoScreen extends StatefulWidget {
  final String selectedYearLevel;
  final String selectedCollege;

  const EnrollmentTwoScreen(
      {Key? key,
      required this.selectedYearLevel,
      required this.selectedCollege})
      : super(key: key);

  @override
  EnrollmentTwoScreenState createState() => EnrollmentTwoScreenState();
}

class EnrollmentTwoScreenState extends State<EnrollmentTwoScreen> {
  String searchQuery = "";
  String selectedFilter = "All";
  StudentData studentData = StudentData();
  List<Student> students = [];
  List<Student> filteredStudents = [];
  final Random random = Random();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    students = studentData.generateStudents();
    filteredStudents = students;
  }

  void _filterStudents(String query) {
    String sanitizedQuery = query.replaceAll('-', '');
    List<Student> filteredList = students.where((student) {
      String sanitizedNumber = student.number.replaceAll('-', '');
      return sanitizedNumber
          .toLowerCase()
          .contains(sanitizedQuery.toLowerCase());
    }).toList();

    if (selectedFilter != "All") {
      filteredList = filteredList
          .where((student) => student.status == selectedFilter)
          .toList();
    }

    setState(() {
      searchQuery = query;
      filteredStudents = filteredList;
    });
  }

  void _sortStudents(bool ascending) {
    filteredStudents.sort((a, b) {
      return ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name);
    });
    setState(() {});
  }

  void _filterByEnrollmentStatus(String status) {
    selectedFilter = status;
    _filterStudents(searchQuery);
  }

  void _showStudentDetails(Student student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Student Details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("STUDENT ID: ${student.number}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("STUDENT NAME: ${student.name}",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const Divider(color: Colors.black),
              ...student.steps
                  .map((step) => _buildStepDetail(
                      step.step, step.description, step.status))
                  .toList(),
              _buildStepDetail("Status", "Enrolled?",
                  student.status == "Enrolled" ? "ENROLLED" : "NOT ENROLLED"),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildStepDetail(String step, String description, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(step,
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold)),
          Text(description, style: const TextStyle(color: Colors.black)),
          Text(status,
              style: TextStyle(
                  color: status == "DONE" ? Colors.green : Colors.redAccent)),
        ],
      ),
    );
  }

  void _generatePdf() async {
    final pdf = pw.Document();
    final List<pw.TableRow> rows = [];

    // Add the header
    rows.add(
      pw.TableRow(
        children: [
          pw.Text(' Number',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(' Name', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(' Status',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );

    for (var student in filteredStudents) {
      rows.add(
        pw.TableRow(
          children: [
            pw.Text(" ${student.number}"),
            pw.Text(" ${student.name}"),
            pw.Text(" ${student.status}"),
          ],
        ),
      );
    }

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'College: ${widget.selectedCollege}\nYear Level: ${widget.selectedYearLevel}',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              children: rows,
            ),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Enrollment'),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 10.v,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the Column horizontally
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 10), // Add padding on top and bottom
                alignment: Alignment
                    .center, // This centers the Text widget within the Container
                child: Text(
                  "LIST OF ${widget.selectedYearLevel} STUDENTS".toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0XFF006699),
                      ),
                ),
              ),
              SizedBox(
                  height: 20
                      .v), // Add some space between the title and the search bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0), // Add padding on the sides
                child: Row(
                  children: [
                    Text(
                      "STUDENT ID:",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(width: 10.h),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          isDense: true,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: _filterStudents,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 20
                      .v), // Add some space between the search bar and the list
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    //scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 12,
                      columns: [
                        const DataColumn(label: Text('Number')),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Name'),
                              PopupMenuButton<bool>(
                                onSelected: _sortStudents,
                                itemBuilder: (BuildContext context) {
                                  return [
                                    const PopupMenuItem<bool>(
                                      value: true,
                                      child: Text("A to Z"),
                                    ),
                                    const PopupMenuItem<bool>(
                                      value: false,
                                      child: Text("Z to A"),
                                    ),
                                  ];
                                },
                                icon: const Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                        DataColumn(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Status'),
                              PopupMenuButton<String>(
                                onSelected: _filterByEnrollmentStatus,
                                itemBuilder: (BuildContext context) {
                                  return ['All', 'Enrolled', 'Not Enrolled']
                                      .map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                                icon: const Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                        ),
                      ],
                      rows: filteredStudents.map((student) {
                        return DataRow(cells: [
                          DataCell(Text(student.number)),
                          DataCell(
                            InkWell(
                              onTap: () => _showStudentDetails(student),
                              child: SizedBox(
                                width: 150.0,
                                child: Text(
                                  student.name,
                                  style: const TextStyle(
                                      fontSize: 14, height: 1.2),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              student.status,
                              style: TextStyle(
                                fontSize: 14,
                                color: student.status == "Enrolled"
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          foregroundColor: Colors.white,
          backgroundColor: const Color(0XFF006699),
          overlayOpacity: 0,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.arrow_upward),
              labelBackgroundColor: const Color(0XFF006699),
              labelStyle: const TextStyle(color: Colors.white),
              onTap: () {
                _scrollController.animateTo(
                  0.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.picture_as_pdf),
              label: 'Print PDF',
              labelBackgroundColor: const Color(0XFF006699),
              labelStyle: const TextStyle(color: Colors.white),
              onTap: _generatePdf,
            ),
          ],
        ),
      ),
    );
  }

  get dropdownValue => null;
}
