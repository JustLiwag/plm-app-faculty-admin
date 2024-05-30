
import 'package:mysample/models/admin/sfe_details_model.dart';

class CollegeData {
  static final List<AcademicYear> academicYears = [
    AcademicYear(year: '2021 1st Sem'),
    AcademicYear(year: '2021 2nd Sem'),
    AcademicYear(year: '2022 1st Sem'),
    AcademicYear(year: '2022 2nd Sem'),
    AcademicYear(year: '2023 1st Sem'),
    AcademicYear(year: '2023 2nd Sem'),
  ];

  static final Map<String, College> colleges = {
    'College of Architecture and Urban Planning': College(
      name: 'College of Architecture',
      appBarTitle: 'CAUP',
      professors: [
        Professor(name: 'Karl Anthony Carlos'),
        Professor(name: 'Lola Robles'),
        Professor(name: 'Agustin Welch'),
        Professor(name: 'Zachery Manning'),
        Professor(name: 'Jean Valencia'),
      ],
      academicYears: academicYears,
    ),
    'College of Education': College(
      name: 'College of Education',
      appBarTitle: 'CED',
      professors: [
        Professor(name: 'Karl Anthony Carlos'),
        Professor(name: 'Lola Robles'),
        Professor(name: 'Agustin Welch'),
        Professor(name: 'Zachery Manning'),
        Professor(name: 'Jean Valencia'),
      ],
      academicYears: academicYears,
    ),
    'College of Engineering and Technology': College(
      name: 'College of Engineering and Technology',
      appBarTitle: 'CET',
      professors: [
        Professor(name: 'Prof A'),
        Professor(name: 'Prof B'),
        Professor(name: 'Prof C'),
      ],
      academicYears: academicYears,
    ),
    'College of Information System & Technology Management': College(
      name: 'College of Information System & Technology Management',
      appBarTitle: 'CISTM',
      professors: [
        Professor(name: 'Prof D'),
        Professor(name: 'Prof E'),
        Professor(name: 'Prof F'),
      ],
      academicYears: academicYears,
    ),
    'College of Humanities, Arts, and Social Sciences': College(
      name: 'College of Humanities, Arts, and Social Sciences',
      appBarTitle: 'CHASS',
      professors: [
        Professor(name: 'Prof G'),
        Professor(name: 'Prof H'),
        Professor(name: 'Prof I'),
      ],
      academicYears: academicYears,
    ),
    'College of Nursing': College(
      name: 'College of Nursing',
      appBarTitle: 'CON',
      professors: [
        Professor(name: 'Prof J'),
        Professor(name: 'Prof K'),
        Professor(name: 'Prof L'),
      ],
      academicYears: academicYears,
    ),
    'College of Physical Therapy': College(
      name: 'College of Physical Therapy',
      appBarTitle: 'CPT',
      professors: [
        Professor(name: 'Prof M'),
        Professor(name: 'Prof N'),
        Professor(name: 'Prof O'),
      ],
      academicYears: academicYears,
    ),
    'College of Science': College(
      name: 'College of Science',
      appBarTitle: 'COS',
      professors: [
        Professor(name: 'Prof P'),
        Professor(name: 'Prof Q'),
        Professor(name: 'Prof R'),
      ],
      academicYears: academicYears,
    ),
    'PLM Business School': College(
      name: 'PLM Business School',
      appBarTitle: 'PBS',
      professors: [
        Professor(name: 'Prof S'),
        Professor(name: 'Prof T'),
        Professor(name: 'Prof U'),
      ],
      academicYears: academicYears,
    ),
    'School of Government': College(
      name: 'School of Government',
      appBarTitle: 'SG',
      professors: [
        Professor(name: 'Prof V'),
        Professor(name: 'Prof W'),
        Professor(name: 'Prof X'),
      ],
      academicYears: academicYears,
    ),
  };
}