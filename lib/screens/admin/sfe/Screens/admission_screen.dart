import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/screens/admin/sfe/Assessment/course_assessment.dart';
import 'package:mysample/screens/admin/sfe/Assessment/faculty_assessment.dart';
import 'package:mysample/screens/admin/sfe/Assessment/overall_screen.dart';
import 'package:mysample/widgets/admin_faculty_button.dart';

class AdmissionMenuScreen extends StatelessWidget {
  const AdmissionMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Faculty Evaluation'),
      body: SingleChildScrollView(
        child: Padding(
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
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
              Container(
                height: 5.0, 
                color: const Color(0XFF006699), 
                margin:
                    const EdgeInsets.only(bottom: 20.0), 
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
      ),
    );
  }
}