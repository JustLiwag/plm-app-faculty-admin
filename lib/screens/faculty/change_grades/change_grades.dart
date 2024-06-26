import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';

class ChangeGradesPage extends StatefulWidget {
  const ChangeGradesPage({Key? key}) : super(key: key);

  @override
  ChangeGradesPageState createState() => ChangeGradesPageState();
}

class ChangeGradesPageState extends State<ChangeGradesPage>{
  double? _changeselectedGrade = 1.00;
  String _changeremark = 'PASSED';

  void _updateRemark() {
    if (_changeselectedGrade == null) {
      _changeremark = 'INC';
    } else if (_changeselectedGrade! <= 3.00) {
      _changeremark = 'PASSED';
    } else {
      _changeremark = 'FAILED';
    }
  }

  Color _changeRemarkColor(String changeremark) {
    switch (changeremark) {
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
        appBar: const CustomAppBar(title: 'Report of Grades'),
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
                buildRow('Subject Number:', 'ICC 0106-1'),
                const SizedBox(height: 15),
                buildRow('Subject Name:', 'Application Development'),
                const SizedBox(height: 15),
                buildRow('Schedule:', 'M 9:30a-12:30p F2F GC 201'),
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
                const SizedBox(height: 40),
                buildRow('Student Number:', '202101387'),
                const SizedBox(height: 15),
                buildRow('Student Name:', 'Dela Cruz B.'),
                const SizedBox(height: 15),
                buildRow('College:', 'BSCS'),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            width: 125,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFF006699)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFF006699)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30, top: 25),
                          child: Text(
                            'CHANGE INTO',
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
                          padding: const EdgeInsets.only(left: 25),
                          child: Container(
                            width: 125,
                            height: 25,
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
                                       value: _changeselectedGrade,
                                   icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF006699),),
                                   iconSize: 24,
                                   elevation: 16,
                                   style: const TextStyle(
                                     color: Colors.black,
                                     fontSize: 12,
                                     fontWeight: FontWeight.w500,
                                     letterSpacing: 0.25,
                                   ),
                                   onChanged: (double? newValue){
                                     setState( () {
                                       _changeselectedGrade = newValue;
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
                            height: 25,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: _changeRemarkColor(_changeremark),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1, color: Color(0xFF006699)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(_changeremark,
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
              const SizedBox(height: 60),
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
                          'SUBMIT CHANGES',
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