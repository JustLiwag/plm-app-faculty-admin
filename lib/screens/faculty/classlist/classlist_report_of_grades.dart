import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:mysample/models/faculty/subject_model.dart';

class Classlist extends StatelessWidget {
  final List<Subject> subjects;

  const Classlist({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Class List'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                const Text(
                  'CURRENT CLASS ASSIGNMENT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1,
                    letterSpacing: 0.25,
                  ),
                ),
                const SizedBox(height: 35),
                const Center(
                  child: Text(
                    '2ND SEMESTER SY 2023-2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF006699),
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      height: 1,
                      letterSpacing: 0.25,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return CourseContainer(subject: subjects[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final Subject subject;

  const CourseContainer({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          width: 350,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color(0x4C000000),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 15,
                right: 45,
                bottom: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        subject.courseCode,
                        style: const TextStyle(
                          color: Color(0xFF006699),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                          letterSpacing: 0.10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        subject.courseTitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 2,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        subject.schedule,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 15,
                bottom: 35,
                child: Container(
                  width: 40,
                  height: 33,
                  decoration: const BoxDecoration(
                    color: Color(0xFF006699),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.download_rounded,
                        size: 21,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        final pdf = generateStudentListPdf(subject);
                        await Printing.layoutPdf(
                          onLayout: (PdfPageFormat format) async => pdf.save(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pw.Document generateStudentListPdf(Subject subject) {
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
                'Class List',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Course Code: ${subject.courseCode}',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Course Title: ${subject.courseTitle}',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.Text(
                'Schedule: ${subject.schedule}',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 10),
            ],
          ),
          pw.TableHelper.fromTextArray(
            context: context,
            headers: ['Student Number', 'Student Name'],
            data: subject.enrolledStudents.map((student) {
              return [
                student.studentNumber,
                student.studentName,
              ];
            }).toList(),
          ),
        ],
      ),
    );

    return pdf;
  }
}
