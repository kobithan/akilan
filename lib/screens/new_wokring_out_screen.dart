
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../data/exercises.dart';
import '../modules/Exercise.dart';

class NewWorkingOutScreen extends StatefulWidget {
  static const routeName = "/NewWorkingOutScreen";

  List<Exercise> exercises = exercises1;

  NewWorkingOutScreen({Key? key,

  }) : super(key: key);

  @override
  _NewWorkingOutScreenState createState() => _NewWorkingOutScreenState();
}

class _NewWorkingOutScreenState extends State<NewWorkingOutScreen> {
  final controller = PageController();
  late Exercise currentExercise;

  @override
  void initState() {
    super.initState();

    currentExercise = widget.exercises.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(currentExercise.exerciseName),
      centerTitle: true,
      backgroundColor: Colors.indigoAccent[100],
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 40,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

    ),
    extendBodyBehindAppBar: true,
    body: Stack(
      children: [
        buildVideos(),
        Positioned(
          bottom: 20,
          right: 50,
          left: 50,
          child: buildVideoControls(),
        )
      ],
    ),
  );

  Widget buildVideos() => PageView(
    controller: controller,
    onPageChanged: (index) => setState(() {
      currentExercise = widget.exercises[index];
    }),
    children: widget.exercises
        .map((exercise) => VideoPlayerWidget(
      exercise: exercise,
      onInitialized: () => setState(() {}),
    ))
        .toList(),
  );

  Widget buildVideoControls() => VideoControlsWidget(
    exercise: currentExercise,
    onTogglePlaying: (isPlaying) {
      setState(() {
        if (isPlaying) {
          currentExercise.controller.play();
        } else {
          currentExercise.controller.pause();
        }
      });
    },
    onNextVideo: () => controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
    onRewindVideo: () => controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    ),
  );
}

class VideoPlayerWidget extends StatefulWidget {
  final Exercise exercise;
  final VoidCallback onInitialized;

  const VideoPlayerWidget({
    required this.exercise,
    required this.onInitialized,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network('https://thumbs.gfycat.com/IlliterateTallIslandcanary.webp');
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: controller.value.isInitialized
        ? VideoPlayer(controller)
        : Center(child: CircularProgressIndicator()),
  );
}


class VideoControlsWidget extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  const VideoControlsWidget({
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white.withOpacity(0.95),
    ),
    height: 142,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildText(
              title: 'Sets',
              value: '${exercise.numOfSets} sets',
            ),
            buildText(
              title: 'Reps',
              value: '${exercise.numOfReps} times',
            ),
          ],
        ),
        buildButtons(context),
      ],
    ),
  );

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        icon: const Icon(
          Icons.undo,
          color: Colors.black87,
          size: 32,
        ),
        onPressed: onRewindVideo,
      ),
      IconButton(
        icon: const Icon(
          Icons.redo,
          color: Colors.black87,
          size: 32,
        ),
        onPressed: onNextVideo,
      ),
    ],
  );

}