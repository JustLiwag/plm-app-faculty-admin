import 'step_detail_model.dart';

class Student {
  final String number;
  final String name;
  final String status;
  final List<StepDetail> steps;

  Student({required this.number, required this.name, required this.status, required this.steps});
}