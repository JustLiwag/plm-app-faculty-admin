import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/data/admin/plmat_applicant_data.dart';
import '../../../../widgets/admin/result_item.dart';

class PLMATScreen extends StatelessWidget {
  const PLMATScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passers = plmatApplicants
        .map((plmatApplicant) => {
              'Applicant Number': plmatApplicant.applicantNumber,
              'Name': plmatApplicant.name,
              'Course': plmatApplicant.course,
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
                'PLMAT Results!',
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
