import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mysample/models/admin/sfe_eval_model.dart';
import 'package:mysample/utils/admin_faculty/app_styles.dart';

class FacultyAssessmentScreen extends StatelessWidget {
  final String? professorName;

  const FacultyAssessmentScreen({super.key, required this.professorName});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final evaluation = professorName != null
        ? FacultyEvaluationData.evaluations[professorName]
        : null;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Faculty Assessment'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: evaluation != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Results for ${evaluation.professorName}',
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: screenHeight / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            topTitles: SideTitles(showTitles: false),
                            leftTitles:
                                SideTitles(showTitles: true, interval: 10),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTitles: (double value) {
                                return value.toInt().toString();
                              },
                            ),
                          ),
                          borderData: FlBorderData(show: true),
                          gridData: FlGridData(show: false),
                          barGroups: evaluation.ratings
                              .map((rating) => BarChartGroupData(
                                    x: rating.rating,
                                    barRods: [
                                      BarChartRodData(
                                        y: rating.studentCount.toDouble(),
                                        colors: [Colors.blue],
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ratings: ${evaluation.averageRating}/5',
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Best: ${evaluation.bestRating}',
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'Worst: ${evaluation.worstRating}',
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Center(
                child: Text(
                  'No evaluation results available for $professorName',
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
      ),
    );
  }
}
