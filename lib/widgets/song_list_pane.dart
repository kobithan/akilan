import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/music.dart';

class SongListPane extends StatefulWidget {
  const SongListPane({Key? key}) : super(key: key);

  @override
  _SongListPaneState createState() => _SongListPaneState();
}

class _SongListPaneState extends State<SongListPane> with TickerProviderStateMixin{
  late AnimationController paneController;
  late Animation<double> paneAnimation;
  bool isAnimCompleted = false;

  final List<Music> songList = List.generate(
    20,
        (index) => const Music(
      songName: 'Song1',
          playlistName: 'playlist1',
          artistName: 'artist1',
          urlImage: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/98abcc50-b73d-43cc-9178-e2d0dd285e47/d9z2qo0-9a473479-c8a1-4d72-933c-bb278d894cea.png/v1/fit/w_375,h_298,q_70,strp/bleach_670___toshiro_by_ajm_fairytail_d9z2qo0-375w.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTk4OSIsInBhdGgiOiJcL2ZcLzk4YWJjYzUwLWI3M2QtNDNjYy05MTc4LWUyZDBkZDI4NWU0N1wvZDl6MnFvMC05YTQ3MzQ3OS1jOGExLTRkNzItOTMzYy1iYjI3OGQ4OTRjZWEucG5nIiwid2lkdGgiOiI8PTI1MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.JmhK9oM0C029qH0gFwr6dFciJMN8rcYN1gA313wB6DQ"
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,

          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              Positioned(
                bottom: paneAnimation.value,
                child: GestureDetector(
                  onTap: () {
                    animationInit();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height/2 ,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.indigoAccent[100],
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent[100],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)
                        )
                    ),
                    child: Center(
                      child: ListView(
                        children: songList.map(_buildSong).toList(),
                      ),
                    ),
                  ),
                ),
              )
              ],
          ),

        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    paneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    paneAnimation =
        Tween<double>(begin: -250, end: 0.0).animate(paneController);
  }

  animationInit() {
    if (isAnimCompleted) {
      paneController.reverse();
    } else {
      paneController.forward();
    }
    isAnimCompleted = !isAnimCompleted;
  }

  @override
  Widget animate(BuildContext context) {
    return AnimatedBuilder(
      animation: paneController,
      builder: (BuildContext context, widget) {
        return build(context);
      },
    );
  }

  Widget _buildSong(Music e) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white10,
        child: ListTile(
          contentPadding: const EdgeInsets.all(5),
          dense: true,
          onTap: () async {},
          title: Text(
            e.songName,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
