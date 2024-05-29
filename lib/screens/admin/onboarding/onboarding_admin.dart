import 'package:flutter/material.dart';
import 'package:mysample/widgets/admin_faculty_button.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/widgets/admin/base_layout.dart';

class OnBoardingAdmin extends StatefulWidget {
  const OnBoardingAdmin({super.key});

  @override
  State<OnBoardingAdmin> createState() => _OnBoardingAdminState();
}

class _OnBoardingAdminState extends State<OnBoardingAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Administrator'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 15), // SizedBox(height: 20
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: const Color(0XFF006699),
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                'We are delighted to welcome you to the Pamantasan ng Lungsod ng Maynila Admin Mobile App.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.baseBlack,
                    ),
              ),
              const SizedBox(height: 23),
              ButtonText(
                text: const Text('Admission'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BaseLayoutPage(initialIndex: 0),
                    ),
                  );
                },
              ),
              ButtonText(
                text: const Text('Announcements'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BaseLayoutPage(initialIndex: 1),
                    ), 
                  );
                },
              ),
              ButtonText(
                text: const Text('Enrollment'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BaseLayoutPage(initialIndex: 2),
                    ), 
                  );
                },
              ),
              ButtonText(
                text: const Text('Student Faculty Evaluation'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BaseLayoutPage(initialIndex: 3),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
