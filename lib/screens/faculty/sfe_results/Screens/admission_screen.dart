import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/course_assessment.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/faculty_assessment.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/overall_screen.dart';
import 'package:mysample/widgets/button.dart';

class AdmissionMenuScreen extends StatelessWidget {
  const AdmissionMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 62.0, 30.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 62.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/plm_logo.png',
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
            ),
            Container(
              height: 5.0, // Adjust the thickness as needed
              color: const Color(0XFF006699), // Adjust the color as needed
              margin:
                  const EdgeInsets.only(bottom: 20.0), // Space below the line
            ),
            const SizedBox(height: 10.0),
            ButtonText(
              text: const Text('Course Assessment Result'),
              icon: Icons.arrow_forward_ios,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseAssessmentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ButtonText(
              text: const Text('Faculty Assessment Result'),
              icon: Icons.arrow_forward_ios,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FacultyAssessmentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ButtonText(
              text: const Text('Overall Assessment Result'),
              icon: Icons.arrow_forward_ios,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OverallScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        trailing: Icon(icon),
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}
