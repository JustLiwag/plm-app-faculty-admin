import 'package:flutter/material.dart';
import 'classlist_report_of_grades.dart';
import 'student.dart';
class SubjectData {
  final String courseCode;
  final String courseTitle;
  final String schedule;

  SubjectData({
    required this.courseCode,
    required this.courseTitle,
    required this.schedule,
  });
}

List<SubjectData> subjectList = [
  SubjectData(
    courseCode: 'ICC 0106-1',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
  ),
  SubjectData(
    courseCode: 'ICC 0106-2',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
  ),
  SubjectData(
    courseCode: 'ICC 0106-3',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
  ),
  SubjectData(
    courseCode: 'ICC 0106-1.3',
    courseTitle: 'Application Development and Emerging Technologies (Laboratory)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
  ),
];

void main() {
  runApp(const SubjectClass());
}

class SubjectClass extends StatelessWidget {
  const SubjectClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SubjectClassPage(),
    );
  }
}

class SubjectClassPage extends StatelessWidget {
  const SubjectClassPage({Key? key}) : super(key: key);

  Widget buildRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              height: 0.09,
              letterSpacing: 0.25,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 14,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w400,
              height: 0.09,
              letterSpacing: 0.25,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                buildRow('Employee Number:', 'XXX XXX'),
                const SizedBox(height: 15),
                buildRow('Full Name:', 'De Leon, Jose'),
                const SizedBox(height: 15),
                buildRow('College:', 'CITSM'),
                const SizedBox(height: 15),
                Container(
                  width: 320,
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
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: studentDataList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16), // Reduced bottom padding
                      child: Stack(
                        alignment: Alignment.center, // Center the children vertically and horizontally
                        children: [
                          Container(
                              width: 350, // Adjusted width
                              height: 70,
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
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 270, // Adjusted width
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 16, right: 8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            subjectList[index].courseCode,
                                            style: const TextStyle(
                                              color: Color(0xFF006699),
                                              fontSize: 12,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w800,
                                              height: 1.0,
                                              letterSpacing: 0.10,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            subjectList[index].courseTitle,
                                            style: const TextStyle(
                                              color: Color(0xFF393939),
                                              fontSize: 8,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w400,
                                              height: 2,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            subjectList[index].schedule,
                                            style: const TextStyle(
                                              color: Color(0xFF393939),
                                              fontSize: 8,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w400,
                                              height: 1.4,
                                              letterSpacing: 0.25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Student()),
                                      );
                                    },
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      margin: const EdgeInsets.only(right: 16),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF006699),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.chevron_right,
                                          size: 21,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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