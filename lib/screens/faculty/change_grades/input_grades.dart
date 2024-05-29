import 'package:flutter/material.dart';
import 'package:mysample/models/faculty/subject_model.dart';
import 'package:mysample/models/faculty/student_model.dart';
import 'package:mysample/models/faculty/faculty_model.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/faculty/build_row.dart';

class InputGradesPage extends StatefulWidget {
  final Student student;
  final Subject subject;
  final Faculty employee;

  const InputGradesPage({Key? key, required this.student, required this.subject, required this.employee}) : super(key: key);

  @override
  InputGradesPageState createState() => InputGradesPageState();
}

class InputGradesPageState extends State<InputGradesPage> {
  double? _selectedGrade = 1.00;
  String _remark = 'PASSED';

  @override
  void initState() {
    super.initState();
    _selectedGrade = double.tryParse(widget.student.grade) ?? 1.00;
    _updateRemark();
  }

  void _updateRemark() {
    if (_selectedGrade == null) {
      _remark = 'INC';
    } else if (_selectedGrade! <= 3.00) {
      _remark = 'PASSED';
    } else {
      _remark = 'FAILED';
    }
  }

  Color _getRemarkColor(String remark) {
    switch (remark) {
      case 'PASSED':
        return const Color(0xFF28A745);
      case 'FAILED':
        return const Color(0xFFA31920);
      case 'INC':
        return const Color(0xFFE9B700);
      default:
        return Colors.white;
    }
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
                BuildRow(title: 'Employee Number:', content: widget.employee.facultyNumber),
                BuildRow(title: 'Full Name:', content: widget.employee.facultyName),
                BuildRow(title: 'College:', content: widget.employee.college),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                BuildRow(title: 'Subject Number:', content: widget.subject.courseCode),
                BuildRow(title: 'Subject Name:', content: widget.subject.courseTitle),
                BuildRow(title: 'Schedule:', content: widget.subject.schedule),
                const SizedBox(height: 15),
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
                const SizedBox(height:15),
                BuildRow(title: 'Student Number:', content: widget.student.studentNumber),
                BuildRow(title: 'Student Name:', content: widget.student.studentName),
                BuildRow(title: 'College:', content: widget.student.college),
                const SizedBox(height: 15),
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
                const SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 22, top: 25),
                            child: Text(
                              'CURRENT GRADE',
                              style: TextStyle(
                                color: Color(0xFF006699),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                letterSpacing: 0.25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Container(
                              width: 135,
                              height: 30,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: Color(0xFF006699)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<double>(
                                  isExpanded: true,
                                  value: _selectedGrade,
                                  icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF006699),),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.25,
                                  ),
                                  onChanged: (double? newValue) {
                                    setState( () {
                                      _selectedGrade = newValue;
                                      _updateRemark();
                                    });
                                  },
                                  items: <double?>[1.00, 1.25, 1.50, 1.75,
                                          2.00, 2.25, 2.50, 2.75,
                                          3.00, 5.00, null]
                                        .map<DropdownMenuItem<double>>((double? value) {
                                          return DropdownMenuItem<double>(
                                            value: value,
                                            child: Center(
                                              child: Text(value == null ? '----' : value.toStringAsFixed(2)),
                                            ),
                                          );
                                        }).toList(),
                                        dropdownColor: Colors.white,
                                        alignment: Alignment.center,
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25, right: 40),
                            child: Text(
                              'REMARKS',
                              style: TextStyle(
                                color: Color(0xFF006699),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              width: 115,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: _getRemarkColor(_remark),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: Color(0xFF006699)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(_remark,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.25,
                              ))
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Insert your logic here for when the button is pressed
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
                            'SUBMIT GRADE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              letterSpacing: -0.90,
                            ),
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
