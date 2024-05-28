import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../data/faculty/teaching_assignment_data.dart';

class TeachingAssignmentsPage extends StatelessWidget {
  const TeachingAssignmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Teaching Assignments'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 5),
                  const Text(
                    'PAMANTASAN NG LUNGSOD NG MAYNILA',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '(University of the City Manila)',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Intramuros, Manila',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '\nCOLLEGE OF INFORMATION SYSTEM AND TECHNOLOGY MANAGEMENT\n',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Teaching Assignments',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '2ND SEMESTER SY 2010-2011',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Center(
                    child: Text(
                      '\n\nThe College has considered you to teach the following subject(s) for the stipulated term.',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 8,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Table(
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        children: [
                          TableRow(
                            children: [
                              buildHeaderTableCell('Subject Code & Section'),
                              buildHeaderTableCell('Subject Title'),
                              buildHeaderTableCell('Units'),
                              buildHeaderTableCell('Schedule'),
                              buildHeaderTableCell('No. of Students'),
                              buildHeaderTableCell('Credited Units'),
                              buildHeaderTableCell('College'),
                              buildHeaderTableCell('Type of Load'),
                            ],
                          ),
                          for (var assignment in teachingAssignments)
                            TableRow(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              children: [
                                buildTableCell(
                                    assignment.subjectCodeAndSection),
                                buildTableCell(assignment.subjectTitle),
                                buildTableCell(assignment.units),
                                buildTableCell(assignment.schedule),
                                buildTableCell(assignment.noStudents),
                                buildTableCell(assignment.creditedUnits),
                                buildTableCell(assignment.college),
                                buildTableCell(assignment.typeOfLoad),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: SizedBox(
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      final pdf = generateTablePdf();
                      await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => pdf.save(),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFFC909)),
                    ),
                    child: const Text('Print',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 11, color: Colors.blue, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  pw.Document generateTablePdf() {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              pw.Text(
                'PAMANTASAN NG LUNGSOD NG MAYNILA',
                style: pw.TextStyle(
                  fontSize: 15,
                  fontWeight: pw.FontWeight.bold,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                '(University of the City Manila)',
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                'Intramuros, Manila',
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                '\nCOLLEGE OF INFORMATION SYSTEM AND TECHNOLOGY MANAGEMENT\n',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 10,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                'Teaching Assignments',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                '2ND SEMESTER SY 2010-2011',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 9,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Text(
                '\n\nThe College has considered you to teach the following subject(s) for the stipulated term.',
                style: const pw.TextStyle(
                  fontSize: 9,
                ),
              ),
              pw.SizedBox(height: 10),
            ],
          ),
          pw.TableHelper.fromTextArray(
            headerAlignment: pw.Alignment.centerLeft,
            data: [
              [
                'Subject Code & Section',
                'Subject Title',
                'Units',
                'Schedule',
                'No. of Students',
                'Credited Units',
                'College',
                'Type of Load'
              ],
              for (var assignment in teachingAssignments)
                [
                  assignment.subjectCodeAndSection,
                  assignment.subjectTitle,
                  assignment.units,
                  assignment.schedule,
                  assignment.noStudents,
                  assignment.creditedUnits,
                  assignment.college,
                  assignment.typeOfLoad,
                ],
            ],
          ),
        ],
      ),
    );

    return pdf;
  }
}
