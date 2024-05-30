class AcademicYear {
  final String year;

  AcademicYear({required this.year});
}

class Professor {
  final String name;

  Professor({required this.name});
}

class College {
  final String name;
  final String appBarTitle;
  final List<Professor> professors;
  final List<AcademicYear> academicYears;

  College({
    required this.name,
    required this.appBarTitle,
    required this.professors,
    required this.academicYears,
  });
}
