import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';

class Course {
  final String code;
  final String title;
  final String schedule;

  const Course({
    required this.code,
    required this.title,
    required this.schedule,
  });
}

class Classlist extends StatelessWidget {
  const Classlist({super.key});

    final List<Course> courses = const [
    Course(
      code: 'ICC 0106-1',
      title: 'Application Development and Emerging Technologies (Lecture)',
      schedule: 'M 9:30a-12:30p F2F GC 201',
    ),
    Course(
      code: 'ICC 0106-2',
      title: 'Application Development and Emerging Technologies (Lecture)',
      schedule: 'T 10:00a-12:00p F2F GC 202',
    ),
    Course(
      code: 'ICC 0106-3',
      title: 'Application Development and Emerging Technologies (Lecture)',
      schedule: 'W 10:00a-12:00p F2F GC 203',
    ),
    Course(
      code: 'ICC 0106-4',
      title: 'Application Development and Emerging Technologies (Lecture)',
      schedule: 'Th 10:00a-12:00p F2F GC 204',
    ),
    // Add more courses as needed
  ];

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
                    fontFamily: 'Manrope',
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
                      fontFamily: 'Manrope',
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
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseContainer(course: courses[index]);
                  },
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const GradesLogin()),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 39),
                        backgroundColor: const Color(0xFF006699),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'REPORT OF GRADES',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                            height: 1,
                            letterSpacing: -0.90,
                          ),
                        ),
                      ),
                    ),
                  ),
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
  final Course course;

  const CourseContainer({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
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
                top: 12,
                left: 16,
                right: 44, // Adjust this value if needed
                bottom: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        course.code,
                        style: const TextStyle(
                          color: Color(0xFF006699),
                          fontSize: 12,
                          fontFamily: 'Manrope',
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
                        course.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontFamily: 'Manrope',
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
                        course.schedule,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontFamily: 'Manrope',
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
                right: 14,
                bottom: 13, // Adjust this value if needed
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Color(0xFF006699),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.download,
                      size: 21,
                      color: Colors.white,
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
}
