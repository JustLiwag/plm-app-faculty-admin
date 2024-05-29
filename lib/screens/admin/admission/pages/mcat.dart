import 'package:flutter/material.dart';
import 'package:mysample/data/admin/applicant_data.dart';
import 'package:mysample/utils/app_styles.dart';
import '../../../../widgets/admin/result_item.dart';

class MCATScreen extends StatelessWidget {
  const MCATScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passers = mcatApplicants
        .map((applicant) => {
              'Applicant Number': applicant.applicantNumber,
              'Name': applicant.name,
            })
        .toList();
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
                      color: const Color(0XFF006699),
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
