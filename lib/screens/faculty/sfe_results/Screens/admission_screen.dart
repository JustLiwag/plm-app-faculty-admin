import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/course_assessment.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/faculty_assessment.dart';
import 'package:mysample/screens/faculty/sfe_results/Assessment/overall_screen.dart';

class AdmissionMenuScreen extends StatelessWidget {
  const AdmissionMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 72.0, 20.0, 20.0), // Adjust top padding to 1 inch below app bar
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
            Container(
              height: 5.0, // Adjust the thickness as needed
              color: const Color(0XFF006699), // Adjust the color as needed
              margin: const EdgeInsets.only(bottom: 20.0), // Space below the line
            ),
            const SizedBox(height: 10.0),
            _buildMenuItem(
              'Course Assessment Result',
              Icons.arrow_forward_ios,
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseAssessmentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildMenuItem(
              'Faculty Assessment Result',
              Icons.arrow_forward_ios,
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FacultyAssessmentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            _buildMenuItem(
              'Overall Result',
              Icons.arrow_forward_ios,
                  () => Navigator.push(
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
      margin: const EdgeInsets.all(5.0), // Adjust the margin as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5, // Adjust the elevation for shadow depth
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    );
  }
}
