import 'Exercise.dart';

class ExerciseSet {
  final String setName;
  final List<Exercise> exercises;
  final String imageUrl;
  final String exerciseType;

  const ExerciseSet({
    required this.setName,
    required this.exercises,
    required this.imageUrl,
    required this.exerciseType,
  });

}