import 'package:flutter/material.dart';
import 'package:mysample/widgets/button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/base_layout.dart';

class OnBoardingFaculty extends StatefulWidget {
  const OnBoardingFaculty({super.key});

  @override
  State<OnBoardingFaculty> createState() => _OnBoardingFacultyState();
}

class _OnBoardingFacultyState extends State<OnBoardingFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Faculty'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15), // SizedBox(height: 20
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.baseGold,
                    ),
              ),
              SizedBox(height: 15),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nEget nunc scelerisque viverra mauris in aliquam sem fringilla. Nunc id cursus metus aliquam. ',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.baseBlack,
                    ),
              ),
              SizedBox(height: 23),
              ButtonText(
                text: Text('View Schedule'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BaseLayoutPage(
                            initialIndex:
                                0)), // Replace 0 with the index of the 'View Schedule' tab
                  );
                },
              ),
              ButtonText(
                text: Text('View Teaching Assignments'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BaseLayoutPage(
                            initialIndex:
                                1)), // Replace 0 with the index of the 'View Schedule' tab
                  );
                },
              ),
              ButtonText(
                text: Text('View Class List & Report of Grades'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BaseLayoutPage(
                            initialIndex:
                                2)), // Replace 0 with the index of the 'View Schedule' tab
                  );
                },
              ),
              ButtonText(
                text: Text('Change Grades'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BaseLayoutPage(
                            initialIndex:
                                3)), // Replace 0 with the index of the 'View Schedule' tab
                  );
                },
              ),
              ButtonText(
                text: Text('View SFE Results'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BaseLayoutPage(
                            initialIndex:
                                4)), // Replace 0 with the index of the 'View Schedule' tab
                  );
                },
              ),
              ButtonText(
                text: Text('Test btn'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {},
              ),
              ButtonText(
                text: Text('Test btn'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
