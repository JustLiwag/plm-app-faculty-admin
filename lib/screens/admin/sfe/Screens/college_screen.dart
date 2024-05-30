import 'package:flutter/material.dart';
import 'package:mysample/models/admin/sfe_details_model.dart';
import 'package:mysample/screens/admin/sfe/Screens/admission_screen.dart';
import 'package:mysample/theme/custom_text_style.dart';
import 'package:mysample/widgets/admin/enrollment/custom_elevated_button.dart';
import 'package:mysample/screens/admin/sfe/Assessment/faculty_assessment.dart';

class CollegeScreen extends StatefulWidget {
  final College college;

  const CollegeScreen({super.key, required this.college});

  @override
  State<CollegeScreen> createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null && selectedProfessor != null;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/plm_logo.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      widget.college.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'SELECT AY SEM',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0XFF006699), width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                isExpanded: true,
                value: selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedOption = newValue!;
                  });
                },
                underline: Container(),
                items: widget.college.academicYears
                    .map<DropdownMenuItem<String>>((AcademicYear year) {
                  return DropdownMenuItem<String>(
                    value: year.year,
                    child: Text(year.year),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'SELECT PROFESSOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0XFF006699), width: 3.0),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                isExpanded: true,
                value: selectedProfessor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedProfessor = newValue!;
                  });
                },
                underline: Container(),
                items: widget.college.professors
                    .map<DropdownMenuItem<String>>((Professor professor) {
                  return DropdownMenuItem<String>(
                    value: professor.name,
                    child: Text(professor.name),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15),
            CustomElevatedButton(
              text: "SUBMIT",
              margin: const EdgeInsets.symmetric(horizontal: 20),
              buttonTextStyle: CustomTextStyles.labelMediumOnPrimaryContainer
                  .copyWith(fontSize: 16.0),
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF006699),
              ),
              width: 500.0,
              onPressed: canSubmit
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdmissionMenuScreen(
                            professorName: selectedProfessor!,
                          ),
                        ),
                      );
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
