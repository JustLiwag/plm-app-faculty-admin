import 'package:flutter/material.dart';
import 'package:mysample/core/app_export.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/faculty/sfe_results/Screens/admission_screen.dart';
import 'package:mysample/widgets/admin/enrollment/custom_elevated_button.dart';

class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key});

  @override
  FacultyScreenState createState() => FacultyScreenState();
}

class FacultyScreenState extends State<FacultyScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
        body: Padding(
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
                      width: 220,
                      height: 220,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.0, // Adjust the thickness as needed
              ),
              const Text(
                'SELECT AY SEM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0XFF006699), width: 3.0),
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
                  items: <String>[
                    '2021 1st Sem',
                    '2021 2nd Sem',
                    '2022 1st Sem',
                    '2022 2nd Sem',
                    '2023 1st Sem',
                    '2023 2nd Sem',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.all(
                            8.0), // Customize this value as needed
                        child: Text(value),
                      ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Customize this value as needed
                  ),
                ),
                width: 500.0,
                onPressed: canSubmit
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdmissionMenuScreen()),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
