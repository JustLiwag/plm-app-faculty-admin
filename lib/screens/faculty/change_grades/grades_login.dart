import 'package:flutter/material.dart';
import 'package:mysample/utils/app_styles.dart';
import 'subject_class.dart';

class GradesLoginPage extends StatelessWidget {
  const GradesLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Report of Grades'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    width: 279.84,
                    height: 262.52,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/plm_logo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 60, left: 0),
                    child: Center(
                      child: Text(
                        'PASSCODE',
                        style: TextStyle(
                          color: Color(0xFFA31920),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 320,
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    obscureText: true,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Passcode',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA5A5A5),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // Handle Key Button Press
                        },
                        child: const Icon(
                          Icons.key_rounded,
                          color: Color(0xFFA5A5A5),
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubjectClassPage()));
                  },
                  child: Container(
                    width: 275,
                    height: 47.75,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26.75, vertical: 13.38),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF006699),
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
                          fontWeight: FontWeight.w400,
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
