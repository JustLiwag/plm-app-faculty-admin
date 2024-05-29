import 'package:flutter/material.dart';
import 'package:mysample/data/faculty/faculty_data.dart';
import 'package:mysample/data/faculty/subject_data.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'student.dart';
import 'package:mysample/widgets/faculty/build_row.dart';

class SubjectClassPage extends StatelessWidget {
  const SubjectClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Report of Grades'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              BuildRow(
                  title: 'Employee Number:', content: faculty.facultyNumber),
              BuildRow(title: 'Full Name:', content: faculty.facultyName),
              BuildRow(title: 'College:', content: faculty.college),
              const SizedBox(height: 15),
              Container(
                width: 340,
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
                itemCount: subjectList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 10, right: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentPage(
                                  subject: subjectList[index],
                                  employee: faculty,
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          subjectList[index].courseCode,
                                          style: const TextStyle(
                                            color: Color(0xFF006699),
                                            fontSize: 12,
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
                                            fontWeight: FontWeight.w400,
                                            height: 1.4,
                                            letterSpacing: 0.25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
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
                              ],
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
    );
  }
}
