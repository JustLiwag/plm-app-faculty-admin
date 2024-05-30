import 'package:flutter/material.dart';
import 'package:mysample/theme/custom_text_style.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/admin/sfe/Screens/colleges.dart';
import 'package:mysample/widgets/admin/enrollment/custom_elevated_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? dropdownValue;

  void _submitForm() {
    if (dropdownValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SelectedOptionScreen(selectedOption: dropdownValue!),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please select an option from the dropdown.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
      body: SingleChildScrollView(
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
                      width: 220,
                      height: 220,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              const Text(
                'SELECT COLLEGE',
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
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  underline: Container(),
                  items: <String>[
                    'College of Architecture and Urban Planning',
                    'College of Education',
                    'College of Engineering and Technology',
                    'College of Information System & Technology Management',
                    'College of Humanities, Arts, and Social Sciences',
                    'College of Nursing',
                    'College of Physical Therapy',
                    'College of Science',
                    'PLM Business School',
                    'School of Government',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                ),
                width: 500.0,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectedOptionScreen extends StatelessWidget {
  final String selectedOption;

  const SelectedOptionScreen({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    switch (selectedOption) {
      case 'College of Architecture and Urban Planning':
        return const CollegeOfArchitectureScreen();
      case 'College of Education':
        return const CollegeOfEducationScreen();
      case 'College of Engineering and Technology':
        return const CollegeOfEngineeringScreen();
      case 'College of Information System & Technology Management':
        return const CollegeOfInformationTechnologyScreen();
      case 'College of Humanities, Arts, and Social Sciences':
        return const CollegeOfHumanitiesScreen();
      case 'College of Nursing':
        return const CollegeOfNursingScreen();
      case 'College of Physical Therapy':
        return const CollegeOfPhysicalTherapyScreen();
      case 'College of Science':
        return const CollegeOfScienceScreen();
      case 'PLM Business School':
        return const PLMBusinessSchoolScreen();
      case 'School of Government':
        return const SchoolOfGovernmentScreen();
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(selectedOption),
          ),
          body: Center(
            child: Text(
              'You selected $selectedOption',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
    }
  }
}
