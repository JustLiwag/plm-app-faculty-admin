import 'package:mysample/models/faculty/student_model.dart';
import 'package:mysample/models/faculty/subject_model.dart';

// Define student lists
List<Student> studentsForSubject1 = [
  Student(
    studentNumber: '123456',
    grade: 'A',
    studentName: 'John Doe',
    college: 'College of Engineering',
  ),
  Student(
    studentNumber: '234567',
    grade: 'B',
    studentName: 'Jane Smith',
    college: 'College of Engineering',
  ),
];

List<Student> studentsForSubject2 = [
  Student(
    studentNumber: '345678',
    grade: 'C',
    studentName: 'Alice Johnson',
    college: 'College of Engineering',
  ),
  Student(
    studentNumber: '456789',
    grade: 'B+',
    studentName: 'Bob Brown',
    college: 'College of Engineering',
  ),
];

List<Student> studentsForSubject3 = [
  Student(
    studentNumber: '567890',
    grade: 'A-',
    studentName: 'Charlie Green',
    college: 'College of Science',
  ),
  Student(
    studentNumber: '678901',
    grade: 'B-',
    studentName: 'Dana White',
    college: 'College of Science',
  ),
];

List<Student> studentsForSubject4 = [
  Student(
    studentNumber: '789012',
    grade: 'B+',
    studentName: 'Evan Blue',
    college: 'College of Arts',
  ),
  Student(
    studentNumber: '890123',
    grade: 'A',
    studentName: 'Fiona Red',
    college: 'College of Arts',
  ),
];

List<Subject> subjectList = [
  Subject(
    courseCode: 'ICC 0106-1',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject1,
  ),
  Subject(
    courseCode: 'ICC 0106-2',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject2,
  ),
  Subject(
    courseCode: 'ICC 0106-3',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject3,
  ),
  Subject(
    courseCode: 'ICC 0106-1.3',
    courseTitle: 'Application Development and Emerging Technologies (Laboratory)',
    schedule: 'M 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject4,
  ),
];
