import 'package:flutter/material.dart';
import 'package:mysample/models/faculty/subject_model.dart';
import 'package:mysample/utils/app_styles.dart';
import 'input_grades.dart';

class StudentPage extends StatelessWidget {
  final Subject subject;

  const StudentPage({Key? key, required this.subject}) : super(key: key);

  Widget buildRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35), // Adjust right padding for better alignment
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF393939),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.25,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                color: Color(0xFF393939),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
              overflow: TextOverflow.ellipsis,
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
        appBar: const CustomAppBar(title: 'Report of Grades'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                buildRow('Subject Number:', subject.courseCode),
                const SizedBox(height: 5),
                buildRow('Subject Name:', subject.courseTitle),
                const SizedBox(height: 5),
                buildRow('Schedule:', subject.schedule),
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
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 16, right: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 350,
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
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 12,
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
                                          '${subject.enrolledStudents[index].studentNumber} ${subject.enrolledStudents[index].grade}',
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
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          subject.enrolledStudents[index]
                                              .studentName,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontFamily: 'Inter',
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
                                          subject
                                              .enrolledStudents[index].college,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 7,
                                            fontFamily: 'Inter',
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
                                              builder: (context) =>
                                                  const InputGradesPage()));
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
                          Positioned(
                            right: 80,
                            bottom: 27,
                            child: Container(
                              width: 50,
                              height: 15,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF006699)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 80,
                            bottom: 10,
                            child: Container(
                              width: 50,
                              height: 15,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF006699)),
                                  borderRadius: BorderRadius.circular(10),
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
