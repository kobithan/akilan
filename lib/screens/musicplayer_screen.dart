import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/playlist_screen.dart';


import '../modules/music.dart';

class MusicPlayerScreen extends StatefulWidget {
  static const routeName = "/MusicPlayerScreen";

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MusicPlayerScreenState();
  }
}

class MusicPlayerScreenState extends State<MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
        //backgroundColor: Colors.black26,
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
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

        ),

        body:
        StackBuilder(),

      );
  }
}

class StackBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackBuilderState();
  }
}

class StackBuilderState extends State<StackBuilder>
    with TickerProviderStateMixin {
  late AnimationController paneController;
  late Animation<double> paneAnimation;
  bool isAnimCompleted = false;

  final List<Music> songList = List.generate(
    20,
        (index) => const Music(
      songName: 'Song1',
          playlistName: 'Playlsit1',
          artistName: 'artist1',
          urlImage: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/98abcc50-b73d-43cc-9178-e2d0dd285e47/d9z2qo0-9a473479-c8a1-4d72-933c-bb278d894cea.png/v1/fit/w_375,h_298,q_70,strp/bleach_670___toshiro_by_ajm_fairytail_d9z2qo0-375w.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTk4OSIsInBhdGgiOiJcL2ZcLzk4YWJjYzUwLWI3M2QtNDNjYy05MTc4LWUyZDBkZDI4NWU0N1wvZDl6MnFvMC05YTQ3MzQ3OS1jOGExLTRkNzItOTMzYy1iYjI3OGQ4OTRjZWEucG5nIiwid2lkdGgiOiI8PTI1MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.JmhK9oM0C029qH0gFwr6dFciJMN8rcYN1gA313wB6DQ"
    ),
  );


  @override
  void initState() {
    super.initState();

    paneController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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

  Widget stackBody(BuildContextcontext) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,

          padding: EdgeInsets.all(20),

          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height*0.5,
                height: MediaQuery.of(context).size.height /2.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.pinimg.com/originals/78/5a/fa/785afa081d98d2d2940a16f9788082e6.png"),
                  ),
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      //color: Colors.lightBlueAccent[100],
                      color: Colors.black38,
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height /4.84,
                //color: Colors.deepPurple[800],
                color: Colors.transparent,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      children: const <Widget>[
                        Text("Song Name",style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w500),),
                        Text("Artist Name",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w500),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text("2.25",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w500),),
                        Text("4.00",style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w500),)

                      ],
                    ),

                    Slider(
                      min: 0,
                      max: 3,
                      value: 1, onChanged: (double value) {  },
                    ),
                    SizedBox(height: 5,),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.skip_previous,size: 30,color: Colors.blue[100],),
                          ),
                          SizedBox(width: 16,),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.play_arrow,size: 30,color: Colors.blue.shade800,),
                          ),
                          SizedBox(width: 16,),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.skip_next,size: 30,color: Colors.blue[100],),
                          ),

                        ],
                      ),
                    )
                  ],
                ),

              ),
            ],
          ),

        ),



        Positioned(
          bottom: paneAnimation.value,
          child: GestureDetector(
            onTap: () {
              animationInit();
            },
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height/2 ,
              width: MediaQuery.of(context).size.width,
              //color: Colors.indigoAccent[100],
              decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)
                  )
              ),
              child: Center(
                child: ListView(
                  children: songList.map(_buildSong).toList(),
                ),
              ),
              /*child: Center(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text("playlist Name"),
                        ListView(
                            children: songList.map(_buildSong).toList()
                        )
                      ],
                    )
                  ],
                ),
              ),*/
              /*child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Text("Playlist Name",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                    ),
                    ListView(
                      children: songList.map(_buildSong).toList(),
                    ),
                  ],
                ),
              ),*/
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: paneController,
      builder: (BuildContext context, widget) {
        return stackBody(context);
      },
    );
  }

  Widget _buildSong(Music e) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white10,
        child: ListTile(
          contentPadding: EdgeInsets.all(5),
          dense: true,
          onTap: () async {},
          title: Text(
            e.songName,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlaylistScreen.routeName);
  }
}
