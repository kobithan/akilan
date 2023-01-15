import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/musicplayer_screen.dart';
import 'package:shape_shifter_fitness_application/screens/workout_home_screen.dart';

import '../widgets/display_playlists_widget.dart';
import 'music_player_screen.dart';



class PlaylistScreen extends StatefulWidget {
  static const routeName = "/PlaylistScreen";

  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
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
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.shade800,
                  Colors.blueGrey.shade50,
                ],
              )
            ),
            child: const PlaylistSet(),

          ),
        ),
        );
  }

  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(WorkoutHomeScreen.routeName);
  }
}
