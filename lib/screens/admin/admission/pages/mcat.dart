import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import '../../../../widgets/admin/result_item.dart';

class MCATScreen extends StatelessWidget {
  MCATScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> passers = [
    {"Applicant Number": "A0001", "Name": "PACQUIAO, Manny D."},
    {"Applicant Number": "A0002", "Name": "MANALOTO, Jose M."},
    {"Applicant Number": "A0003", "Name": "RIZAL, Jose P."},
    {"Applicant Number": "A0004", "Name": "VELOSO, Mary Jane A."},
    {"Applicant Number": "A0005", "Name": "SANTOS, Leni G."},
    {"Applicant Number": "A0006", "Name": "AGUINALDO, Emilio A."},
    {"Applicant Number": "A0007", "Name": "MORALES, Erik"},
    {"Applicant Number": "A0008", "Name": "LUNA, Juan N."},
    {"Applicant Number": "A0009", "Name": "SANTOS, Maria Leonora T."},
    {"Applicant Number": "A0010", "Name": "MANALOTO, Manuel A."},
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
                'MCAT Results!',
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
