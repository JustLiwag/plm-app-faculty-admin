import 'package:flutter/material.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';
import 'package:mysample/widgets/admin/enrollment/dropdown.dart';
import 'package:mysample/widgets/admin/enrollment/show_warning.dart';
import '../../../core/app_export.dart';
import '../../../widgets/admin/enrollment/custom_elevated_button.dart';
import 'enrollment_two_screen.dart';

class EnrollmentOneScreen extends StatefulWidget {
  final String selectedCollege;

  const EnrollmentOneScreen({Key? key, required this.selectedCollege})
      : super(key: key);

  @override
  EnrollmentOneScreenState createState() => EnrollmentOneScreenState();
}

class EnrollmentOneScreenState extends State<EnrollmentOneScreen> {
  String? dropdownValue;
  bool isYearLevelSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Enrollment'),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 22,
            top: 70,
            right: 22,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPlmSealBorApproved2014,
                height: 164,
                width: 165,
              ),
              const SizedBox(height: 27),
              SizedBox(
                width: 305,
                child: Text(
                  widget.selectedCollege,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Dropdown(
                  onSelected: (String? college) {
                    isYearLevelSelected = college != null;
                    dropdownValue = college;
                  },
                  values: const [
                    '1st Year',
                    '2nd Year',
                    '3rd Year',
                    '4th Year',
                    '5th Year',
                    '6th Year'
                  ],
                  title: 'YEAR LEVEL'),
              const SizedBox(height: 52),
              CustomElevatedButton(
                text: "SUBMIT",
                margin: const EdgeInsets.symmetric(horizontal: 37),
                buttonTextStyle: CustomTextStyles.labelMediumOnPrimaryContainer
                    .copyWith(fontSize: 16.0),
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF006699),
                ),
                onPressed: () {
                  if (dropdownValue == null) {
                    showWarningDialog(context,
                        "Please select a year level before submitting.");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EnrollmentTwoScreen(
                          selectedYearLevel: dropdownValue ?? '',
                          selectedCollege: widget.selectedCollege,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
