class FacultyEvaluation {
  final String professorName;
  final List<Rating> ratings;
  final double averageRating;
  final int bestRating;
  final int worstRating;

  FacultyEvaluation({
    required this.professorName,
    required this.ratings,
    required this.averageRating,
    required this.bestRating,
    required this.worstRating,
  });
}

class Rating {
  final int rating;
  final int studentCount;

  Rating({
    required this.rating,
    required this.studentCount,
  });
}

class FacultyEvaluationData {
  static final Map<String, FacultyEvaluation> evaluations = {
    'Karl Anthony Carlos': FacultyEvaluation(
      professorName: 'Karl Anthony Carlos',
      ratings: [
        Rating(rating: 1, studentCount: 10),
        Rating(rating: 2, studentCount: 15),
        Rating(rating: 3, studentCount: 20),
        Rating(rating: 4, studentCount: 25),
        Rating(rating: 5, studentCount: 30),
      ],
      averageRating: 3.0,
      bestRating: 5,
      worstRating: 1,
    ),
    'Lola Robles': FacultyEvaluation(
      professorName: 'Lola Robles',
      ratings: [
        Rating(rating: 1, studentCount: 12),
        Rating(rating: 2, studentCount: 18),
        Rating(rating: 3, studentCount: 22),
        Rating(rating: 4, studentCount: 28),
        Rating(rating: 5, studentCount: 35),
      ],
      averageRating: 3.5,
      bestRating: 5,
      worstRating: 1,
    ),
  };
}
