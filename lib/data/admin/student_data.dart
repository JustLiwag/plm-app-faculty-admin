import 'dart:math';
import '../../models/admin/student_model.dart';
import '../../models/admin/step_detail_model.dart';

class StudentData {
  final Random random = Random();

  List<Student> generateStudents() {
    List<String> names = [
      "Dela Cruz, Juan M.",
      "Dela Cruz, Juan Coco Martin M.",
      "Dela Cruz, Juan Karlos M.",
      "Estepan, Estavia Jorge G.",
      "Erwan, Heussaf M.",
      "Egg, Dog H.",
      "Smith, John A.",
      "Doe, Jane B.",
      "Johnson, Michael C.",
      "Williams, Sarah D.",
      "Brown, Chris E.",
      "Jones, Pat F.",
      "Garcia, Maria G.",
      "Martinez, Luis H.",
      "Rodriguez, Ana I.",
      "Hernandez, Miguel J.",
      "Lopez, Laura K.",
      "Gonzalez, Carlos L.",
      "Wilson, Emily M.",
      "Anderson, James N.",
      "Thomas, Robert O.",
      "Taylor, Linda P.",
      "Moore, David Q.",
      "Jackson, Barbara R.",
      "Martin, Richard S.",
      "Lee, Susan T."
    ];

    return List<Student>.generate(names.length, (index) {
      List<StepDetail> steps = [];
      bool allStepsDone = true;
      bool previousStepDone = true;

      for (int stepIndex = 0; stepIndex < 4; stepIndex++) {
        bool isDone = previousStepDone ? random.nextBool() : false;
        if (!isDone) {
          allStepsDone = false;
        }
        steps.add(StepDetail(
          step: "Step ${stepIndex + 1}",
          description: getStepDescription(stepIndex + 1),
          status: isDone ? "DONE" : "PENDING",
        ));
        previousStepDone = isDone;
      }

      return Student(
        number: "2021-${random.nextInt(90000) + 10000}",
        name: names[index],
        status: allStepsDone ? "Enrolled" : "Not Enrolled",
        steps: steps,
      );
    });
  }

  String getStepDescription(int step) {
    switch (step) {
      case 1:
        return "View / Enlistment Schedule";
      case 2:
        return "View Assessment";
      case 3:
        return "Register";
      case 4:
        return "View Registration Form";
      default:
        return "";
    }
  }
}