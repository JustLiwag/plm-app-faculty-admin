import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/screens/faculty/sfe_results/Screens/admission_screen.dart';

class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key});

  @override
  FacultyScreenState createState() =>FacultyScreenState();
}

class FacultyScreenState
    extends State<FacultyScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            20.0, 1.0 * 72.0, 20.0, 20.0), // Adjust top padding to 1 inch below app bar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image and description added here
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/plm_logo.png', // Your image path
                    width: 200, // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                  ),
                ],
              ),
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
                underline: Container(), // Remove the underline
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
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: canSubmit
                  ? () {
                // Navigate to the admission screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdmissionMenuScreen()),
                );
              }
                  : null, // Disable button if either dropdown is not selected
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF006699), // Match the yellow background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Preserve the rounded corners
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white), // Set the text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}