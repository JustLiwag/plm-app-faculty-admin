import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import '../../../../widgets/admin/result_item.dart';

class PLMATScreen extends StatelessWidget {
  PLMATScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> passers = [
    {"Number": "A0001", "Name": "ROBREDO, Maria Leonor G.", "Course": "BS PSY"},
    {"Number": "A0002", "Name": "SANTIAGO, Miriam P.", "Course": "BS CS"},
    {"Number": "A0003", "Name": "CLARA, Maria B.", "Course": "BS IT"},
    {"Number": "A0004", "Name": "EINSTEIN, Alberto C.", "Course": "BS MATH"},
    {"Number": "A0005", "Name": "DARWIN, Charles D.", "Course": "BS BIO"},
    {"Number": "A0006", "Name": "TESLA, Nikol E.", "Course": "BS PT"},
    {"Number": "A0007", "Name": "CURIE, Marie F.", "Course": "BS ECE"},
    {"Number": "A0008", "Name": "KINGSLEY, Austin H.", "Course": "BS CE"},
    {"Number": "A0009", "Name": "QUEZON, Game S.", "Course": "BS CHE"},
    {"Number": "A0010", "Name": "SWIFT, Taylor A.", "Course": "BAC"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admissions'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Text(
                'Schedule!',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppTheme.baseGold,
                    ),
              ),
              ResultItem(
                passers: passers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
