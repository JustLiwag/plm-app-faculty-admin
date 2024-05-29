import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/screens/admin/sfe/Screens/colleges.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? dropdownValue;

  void _submitForm() {
    // Check if dropdownValue is not null
    if (dropdownValue != null) {
      // Navigate to a new screen with the selected option's name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectedOptionScreen(selectedOption: dropdownValue!),
        ),
      );
    } else {
      // Show an error message if no option is selected
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200, // Adjust the height as needed
                child: Image.asset('assets/images/plm_logo.png'), // Change 'your_image.png' to your image asset
              ),
              const SizedBox(height: 20),
              const Text(
                'SFE Results',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'SELECT COLLEGE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0XFF006699), width: 3.0),
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
                  underline: Container(), // Remove the underline
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
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _submitForm,
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