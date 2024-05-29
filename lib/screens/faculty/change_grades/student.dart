import 'package:flutter/material.dart';
import 'package:mysample/models/faculty/subject_model.dart';
import 'package:mysample/models/faculty/faculty_model.dart';
import 'package:mysample/utils/app_styles.dart';
import 'input_grades.dart';
import 'package:mysample/widgets/faculty/build_row.dart';

class StudentPage extends StatelessWidget {
  final Subject subject;
  final Faculty employee;

  const StudentPage({Key? key, required this.subject, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Report of Grades'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                BuildRow(title: 'Subject Number:', content: subject.courseCode),
                const SizedBox(height: 5),
                BuildRow(title: 'Subject Name:', content: subject.courseTitle),
                const SizedBox(height: 5),
                BuildRow(title: 'Schedule:', content: subject.schedule),
                const SizedBox(height: 5),
                Container(
                  width: 309,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFF006699),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: subject.enrolledStudents.length,
                  itemBuilder: (context, index) {
                    final student = subject.enrolledStudents[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 16, right: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 350,
                            height: 90,
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
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 25,
                                  left: 16,
                                  right: 44,
                                  bottom: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          student.studentNumber,
                                          style: const TextStyle(
                                            color: Color(0xFF006699),
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w800,
                                            height: 1.0,
                                            letterSpacing: 0.10,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          student.studentName,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            height: 2,
                                            letterSpacing: 0.25,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          student.college,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            height: 2,
                                            letterSpacing: 0.25,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 14,
                                  bottom: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InputGradesPage(
                                            student: student,
                                            subject: subject,
                                            employee: employee,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 28,
                                      height: 29,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF006699),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            right: 90,
                            bottom: 63,
                            child: Text(
                              'GRADE',
                              style: TextStyle(
                                color: Color(0xFF006699),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 40,
                            child: Container(
                              width: 60,
                              height: 20,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF006699)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  student.grade,
                                  style: const TextStyle(
                                    color: Color(0xFF006699),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 15,
                            child: Container(
                              width: 60,
                              height: 20,
                              decoration: ShapeDecoration(
                                color: student.remarks == 'Passed'
                                    ? Colors.green
                                    : student.remarks == 'INC'
                                        ? Colors.yellow
                                        : Colors.red,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: student.remarks == 'Passed'
                                          ? Colors.green
                                          : student.remarks == 'INC'
                                              ? Colors.yellow
                                              : Colors.red),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  student.remarks,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
