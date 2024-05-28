import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'package:mysample/widgets/admin/enrollment/dropdown.dart';
import 'package:mysample/widgets/admin/enrollment/show_warning.dart';
import '../../../core/app_export.dart';
import '../../../widgets/admin/enrollment/custom_elevated_button.dart';
import 'enrollment_one_screen.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({super.key});

  @override
  EnrollmentPageState createState() => EnrollmentPageState();
}

class EnrollmentPageState extends State<EnrollmentPage> {
  String? dropdownValue;
  bool isCollegeSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Enrollment'),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 40.h,
            top: 65.v,
            right: 40.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPlmSealBorApproved2014,
                height: 242.v,
                width: 259.h,
              ),
              SizedBox(height: 65.v),
              Dropdown(
                onCollegeSelected: (String? college) {
                  isCollegeSelected = college != null;
                  dropdownValue = college;
                },
                colleges: const [
                  'College of Architecture and Urban Planning',
                  'College of Education',
                  'College of Engineering and Technology',
                  'College of Nursing',
                  'College of Physical Therapy',
                  'College of Information System & Technology Management',
                  'College of Science',
                  'PLM Business School',
                  'College of Humanities, Arts, and Social Sciences',
                  'School of Government',
                ],
                title: 'SELECT A COLLEGE',
              ),
              SizedBox(height: 57.v),
              CustomElevatedButton(
                text: "SUBMIT",
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                buttonTextStyle: CustomTextStyles.labelMediumOnPrimaryContainer
                    .copyWith(fontSize: 16.0),
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF006699),
                ),
                onPressed: () {
                  if (isCollegeSelected) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnrollmentOneScreen(
                            selectedCollege: dropdownValue ?? ''),
                      ),
                    ).then((_) {});
                  } else {
                    showWarningDialog(
                        context, "Please select a college before submitting.");
                  }
                },
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }
}