import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
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
          padding: EdgeInsets.only(
            left: 22.h,
            top: 70.v,
            right: 22.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgPlmSealBorApproved2014,
                height: 164.v,
                width: 165.h,
              ),
              SizedBox(height: 27.v),
              SizedBox(
                width: 305.h,
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
              SizedBox(height: 50.v),
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
              SizedBox(height: 52.v),
              CustomElevatedButton(
                text: "SUBMIT",
                margin: EdgeInsets.symmetric(horizontal: 37.h),
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
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumnyearlevel(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        children: [
          Text(
            "YEAR LEVEL",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 13.v),
          Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(0, 102, 153, 100), width: 3.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              hint: const Text("    Select Year Level"),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              underline: Container(),
              items: <String>[
                '1st Year',
                '2nd Year',
                '3rd Year',
                '4th Year',
                '5th Year',
                '6th Year'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
