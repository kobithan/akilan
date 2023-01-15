import 'package:video_player/video_player.dart';

class Exercise {
  final String exerciseName;
  final String urlVideo;
  final Duration duration;
  final int numOfReps;
  final int numOfSets;
  late VideoPlayerController controller;
  final double caloriesBurned;

  Exercise({
    required this.exerciseName,
    required this.urlVideo,
    required this.duration,
    required this.numOfReps,
    required this.numOfSets,
    required this.caloriesBurned
  });

  String get exName => exerciseName;
  String get exVid => urlVideo;
  Duration get time => duration;
  int get reps => numOfReps;
  int get sets => numOfSets;

  Exercise get first => Exercise(exerciseName: exerciseName, urlVideo: urlVideo, duration: duration, numOfReps: numOfReps, numOfSets: numOfSets, caloriesBurned: caloriesBurned);
  
}
