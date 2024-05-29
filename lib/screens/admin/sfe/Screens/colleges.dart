import 'package:flutter/material.dart';
import 'package:mysample/theme/custom_text_style.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/admin/sfe/Screens/admission_screen.dart';
import 'package:mysample/widgets/admin/enrollment/custom_elevated_button.dart';

class CollegeOfArchitectureScreen extends StatefulWidget {
  const CollegeOfArchitectureScreen({super.key});

  @override
  CollegeOfArchitectureScreenState createState() =>
      CollegeOfArchitectureScreenState();
}

class CollegeOfArchitectureScreenState
    extends State<CollegeOfArchitectureScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CAUP'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Architecture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfEducationScreen extends StatefulWidget {
  const CollegeOfEducationScreen({super.key});

  @override
  CollegeOfEducationScreenState createState() =>
      CollegeOfEducationScreenState();
}

class CollegeOfEducationScreenState extends State<CollegeOfEducationScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CED'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Education',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfEngineeringScreen extends StatefulWidget {
  const CollegeOfEngineeringScreen({super.key});

  @override
  CollegeOfEngineeringScreenState createState() =>
      CollegeOfEngineeringScreenState();
}

class CollegeOfEngineeringScreenState
    extends State<CollegeOfEngineeringScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CET'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Engineering and Technology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfInformationTechnologyScreen extends StatefulWidget {
  const CollegeOfInformationTechnologyScreen({super.key});

  @override
  CollegeOfInformationTechnologyScreenState createState() =>
      CollegeOfInformationTechnologyScreenState();
}

class CollegeOfInformationTechnologyScreenState
    extends State<CollegeOfInformationTechnologyScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CISTM'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Information System and Technology Management',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfHumanitiesScreen extends StatefulWidget {
  const CollegeOfHumanitiesScreen({super.key});

  @override
  CollegeOfHumanitiesScreenState createState() =>
      CollegeOfHumanitiesScreenState();
}

class CollegeOfHumanitiesScreenState extends State<CollegeOfHumanitiesScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CHASS'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Humanities',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfNursingScreen extends StatefulWidget {
  const CollegeOfNursingScreen({super.key});

  @override
  CollegeOfNursingScreenState createState() => CollegeOfNursingScreenState();
}

class CollegeOfNursingScreenState extends State<CollegeOfNursingScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CN'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Nursing',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfPhysicalTherapyScreen extends StatefulWidget {
  const CollegeOfPhysicalTherapyScreen({super.key});

  @override
  CollegeOfPhysicalTherapyScreenState createState() =>
      CollegeOfPhysicalTherapyScreenState();
}

class CollegeOfPhysicalTherapyScreenState
    extends State<CollegeOfPhysicalTherapyScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CPT'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Physical Therapy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class CollegeOfScienceScreen extends StatefulWidget {
  const CollegeOfScienceScreen({super.key});

  @override
  CollegeOfScienceScreenState createState() => CollegeOfScienceScreenState();
}

class CollegeOfScienceScreenState extends State<CollegeOfScienceScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'CS'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'College of Science',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class PLMBusinessSchoolScreen extends StatefulWidget {
  const PLMBusinessSchoolScreen({super.key});

  @override
  PLMBusinessSchoolScreenState createState() => PLMBusinessSchoolScreenState();
}

class PLMBusinessSchoolScreenState extends State<PLMBusinessSchoolScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'PLMBS'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Text(
                    'PLM Business School',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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

class SchoolOfGovernmentScreen extends StatefulWidget {
  const SchoolOfGovernmentScreen({super.key});

  @override
  SchoolOfGovernmentScreenState createState() =>
      SchoolOfGovernmentScreenState();
}

class SchoolOfGovernmentScreenState extends State<SchoolOfGovernmentScreen> {
  String? selectedOption;
  String? selectedProfessor;

  @override
  Widget build(BuildContext context) {
    bool canSubmit = selectedOption != null &&
        selectedProfessor != null; // Check if both dropdowns are selected
    return Scaffold(
      appBar: const CustomAppBar(title: 'SOG'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0 * 72.0, 20.0,
            20.0), // Adjust top padding to 1 inch below app bar
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
                  const SizedBox(height: 10),
                  const Text(
                    'School of Government',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
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
            const SizedBox(height: 20), // Add some space between the dropdowns
            const Text(
              'SELECT PROFESSOR',
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
                underline: Container(), // Remove the underline
                items: <String>[
                  'Karl Anthony Carlos',
                  'Lola Robles',
                  'Agustin Welch',
                  'Zachery Manning',
                  'Jean Valencia',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
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
                            builder: (context) => const AdmissionMenuScreen()),
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
