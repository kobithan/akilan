import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/musicplayer_screen.dart';

import '../data/playlists.dart';
import '../modules/playlist_info.dart';
import '../screens/music_player_screen.dart';


class PlaylistSet extends StatefulWidget {
  const PlaylistSet({Key? key}) : super(key: key);

  @override
  _PlaylistSetState createState() => _PlaylistSetState();
}

class _PlaylistSetState extends State<PlaylistSet> {
  List<Playlist> playlists = allPlaylists;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlists.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          child: Material(
            color: Colors.white70,
            elevation: 10,
            borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(

              splashColor: Colors.black26,
              onTap: (){
                goToNewPage(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Ink.image(
                      image: NetworkImage(playlists[index].urlImage),
                      height: 150,
                      width: MediaQuery.of(context).size.width-20,
                      fit: BoxFit.cover,
                      child: Center(
                        child: Text(
                            playlists[index].playlistName,
                            style: const TextStyle(
                                fontFamily: "HeadingFont",
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)
                        ),
                      ),
                    ),
                  ),

                ],
              ),


            ),
          ),
        );
        /*return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.black54,
                    image: DecorationImage(
                      image: AssetImage("assets/images/workout_image.jpg"),),
                    shape: BoxShape.rectangle
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: Size(100, 40), //////// HERE
                  ),
                  onPressed: () {
                    goToNewPage(context);
                  },
                  child: Text('Playlist Name'),
                ),
              ),
            ],
          ),
        );*/
      },

    );
  }

  void goToNewPage(BuildContext ctx) {
    //Navigator.of(ctx).pushNamed(MusicPlayer.routeName);
    Navigator.of(ctx).pushNamed(MusicPlayerScreen.routeName);

  }
}
