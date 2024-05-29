import 'package:flutter/material.dart';
import 'package:mysample/widgets/button.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/faculty/base_layout.dart';

class OnBoardingFaculty extends StatefulWidget {
  const OnBoardingFaculty({super.key});

  @override
  State<OnBoardingFaculty> createState() => _OnBoardingFacultyState();
}

class _OnBoardingFacultyState extends State<OnBoardingFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Faculty'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: const Color(0XFF006699),
                    ),

              ),
              const SizedBox(height: 15),
              Text(
                'We are delighted to welcome you to the Pamantasan ng Lungsod ng Maynila Faculty Mobile App.',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.baseBlack,
                    ),
              ),
              const SizedBox(height: 23),
              ButtonText(
                text: const Text('View Schedule'),
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
                text: const Text('View Teaching Assignments'),
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
                text: const Text('View Class List'),
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
                text: const Text('View Report of Grades'),
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
              ButtonText(
                text: const Text('View SFE Results'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BaseLayoutPage(initialIndex: 4),
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
