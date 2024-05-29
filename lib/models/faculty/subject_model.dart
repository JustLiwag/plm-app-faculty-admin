import 'package:mysample/models/faculty/student_model.dart';

class Subject {
  final String courseCode;
  final String courseTitle;
  final String schedule;
  final List<Student> enrolledStudents;

  Subject({
    required this.courseCode,
    required this.courseTitle,
    required this.schedule,
    required this.enrolledStudents,
  });
}
