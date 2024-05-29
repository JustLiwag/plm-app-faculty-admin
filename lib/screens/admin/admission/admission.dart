import 'package:flutter/material.dart';
import 'package:mysample/screens/admin/admission/pages/admission_schedule.dart';
import 'package:mysample/screens/admin/admission/pages/clat.dart';
import 'package:mysample/screens/admin/admission/pages/mcat.dart';
import 'package:mysample/screens/admin/admission/pages/plmat.dart';
import 'package:mysample/widgets/button.dart';
import 'package:mysample/utils/app_styles.dart';

class Admission extends StatelessWidget {
  const Admission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admissions'),
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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\nEget nunc scelerisque viverra mauris in aliquam sem fringilla. Nunc id cursus metus aliquam. ',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.baseBlack,
                    ),
              ),
              const SizedBox(height: 23),
              ButtonText(
                text: const Text('PLM Admission Schedule'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdmissionScheduleScreen(),
                    ),
                  );
                },
              ),
              ButtonText(
                text: const Text('PLMAT Results'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PLMATScreen(),
                    ),
                  );
                },
              ),
              ButtonText(
                text: const Text('CLAT Results'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CLATScreen()
                    ),
                  );
                },
              ),
              ButtonText(
                text: const Text('MCAT Results'),
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MCATScreen()
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
