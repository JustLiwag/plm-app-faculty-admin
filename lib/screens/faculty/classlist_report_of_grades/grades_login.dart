import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'classlist_report_of_grades.dart';
import 'subject_class.dart';

void main() {
  runApp(const GradesLogin());
}
//REPORTS OF GRADE_LOGIN VER
class GradesLogin extends StatelessWidget {
  const GradesLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GradesLoginPage(),
    );
  }
}


class GradesLoginPage extends StatelessWidget {
  const GradesLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(title: 'Grades Login'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  width: 259.84,
                  height: 242.52,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/plm_logo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(top: 60, left: 70),
                  child: Text(
                    'PASSCODE',
                    style: TextStyle(
                      color: Color(0xFF006699),
                      fontSize: 15,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 280,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF006699),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextField(
                  obscureText: true, // Make text input hidden, suitable for passcode
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none, // Hides the underline of the input field
                    hintText: 'Enter Passcode',
                    hintStyle: const TextStyle(
                      color: Color(0xFFA5A5A5),
                      fontSize: 14,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Handle Key Button Press
                      },
                      child: const Icon(
                        Icons.key_rounded,
                        color: Color(0xFFA5A5A5),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                      builder: (context) => SubjectClass()));
                  // Handle login button press
                },
                child: Container(
                  width: 240,
                  height: 42.75,
                  padding: const EdgeInsets.symmetric(horizontal: 26.75, vertical: 13.38),
                  decoration: ShapeDecoration(
                    color: Color(0xFF006699),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.38),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}