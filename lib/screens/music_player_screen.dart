import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/playlist_screen.dart';

import '../widgets/play_music_pane.dart';


class MusicPlayer extends StatefulWidget {
  static const routeName = "/MusicPlayer";

  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MusicPlayerState();
  }
}

class MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        //backgroundColor: Colors.black26,
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            backgroundColor: Colors.indigoAccent[100],
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.queue_music,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 42,
                ),
                onPressed: () {},
              ),
            ]

        ),
        /*body: SingleChildScrollView(child: Container(
          child: Column(
            children: [
              PlayMuiscPane(),
            ],
          ),),

        ),*/

        body: Column(
          children: const [
            PlayMuiscPane(),
          ],
        ),
      );
  }

  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlaylistScreen.routeName);
  }
}