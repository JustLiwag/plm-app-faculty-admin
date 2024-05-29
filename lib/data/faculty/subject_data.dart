import 'package:mysample/models/faculty/student_model.dart';
import 'package:mysample/models/faculty/subject_model.dart';

List<Student> studentsForSubject1 = [
  Student(
    studentNumber: '202101350',
    grade: '1.00',
    studentName: 'John Doe',
    college: 'College of Engineering',
    remarks: 'Passed',
  ),
  Student(
    studentNumber: '202101351',
    grade: '1.25',
    studentName: 'Jane Smith',
    college: 'College of Engineering',
    remarks: 'Passed',
  ),
];

List<Student> studentsForSubject2 = [
  Student(
    studentNumber: '202101352',
    grade: '1.25',
    studentName: 'Alice Johnson',
    college: 'College of Engineering',
    remarks: 'Passed',
  ),
  Student(
    studentNumber: '202101353',
    grade: '1.50',
    studentName: 'Bob Brown',
    college: 'College of Engineering',
    remarks: 'Passed',
  ),
];

List<Student> studentsForSubject3 = [
  Student(
    studentNumber: '202101354',
    grade: '1.25',
    studentName: 'Charlie Green',
    college: 'College of Science',
    remarks: 'Passed',
  ),
  Student(
    studentNumber: '202101355',
    grade: '1.75',
    studentName: 'Dana White',
    college: 'College of Science',
    remarks: 'Passed',
  ),
];

List<Student> studentsForSubject4 = [
  Student(
    studentNumber: '202101356',
    grade: '1.25',
    studentName: 'Evan Blue',
    college: 'College of Arts',
    remarks: 'Passed',
  ),
  Student(
    studentNumber: '202101357',
    grade: '1.25',
    studentName: 'Fiona Red',
    college: 'College of Arts',
    remarks: 'Passed',
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
    schedule: 'W 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject2,
  ),
  Subject(
    courseCode: 'ICC 0106-3',
    courseTitle: 'Application Development and Emerging Technologies (Lecture)',
    schedule: 'F 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject3,
  ),
  Subject(
    courseCode: 'ICC 0106-1.3',
    courseTitle: 'Application Development and Emerging Technologies (Laboratory)',
    schedule: 'S 9:30a-12:30p F2F GC 201',
    enrolledStudents: studentsForSubject4,
  ),
];
