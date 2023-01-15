import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/widgets/song_list_pane.dart';

class PlayMuiscPane extends StatefulWidget {
  const PlayMuiscPane({Key? key}) : super(key: key);

  @override
  _PlayMuiscPaneState createState() => _PlayMuiscPaneState();
}

class _PlayMuiscPaneState extends State<PlayMuiscPane> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.height*0.5,
                height: MediaQuery.of(context).size.height /2.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/98abcc50-b73d-43cc-9178-e2d0dd285e47/d9z2qo0-9a473479-c8a1-4d72-933c-bb278d894cea.png/v1/fit/w_375,h_298,q_70,strp/bleach_670___toshiro_by_ajm_fairytail_d9z2qo0-375w.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTk4OSIsInBhdGgiOiJcL2ZcLzk4YWJjYzUwLWI3M2QtNDNjYy05MTc4LWUyZDBkZDI4NWU0N1wvZDl6MnFvMC05YTQ3MzQ3OS1jOGExLTRkNzItOTMzYy1iYjI3OGQ4OTRjZWEucG5nIiwid2lkdGgiOiI8PTI1MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.JmhK9oM0C029qH0gFwr6dFciJMN8rcYN1gA313wB6DQ"),
                  ),
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      //color: Colors.lightBlueAccent[100],
                      color: Colors.black38,
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.height,
                height: MediaQuery.of(context).size.height /4.84,
                //color: Colors.deepPurple[800],
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
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
                      value: 1,
                      onChanged: (double value) {  },
                    ),
                    const SizedBox(height: 5,),
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
                          const SizedBox(width: 16,),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(Icons.play_arrow,size: 30,color: Colors.blueAccent[100],),
                          ),
                          const SizedBox(width: 16,),
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
              const SongListPane(),
            ],
          ),

        ),
      ],
    );
  }
}
