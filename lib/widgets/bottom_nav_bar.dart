import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/contact_instructor_screen.dart';
import '../screens/music_player_screen.dart';
import '../screens/playlist_screen.dart';
import '../screens/report_page_screen.dart';
import '../screens/workout_home_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    const ReportPage(),
    const WorkoutHomeScreen(),
    const PlaylistScreen(),
    const MusicPlayer(),
    const ContactInstructorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.sticky_note_2,size:30),
      const Icon(Icons.fitness_center,size:30),
      const Icon(Icons.home,size:30),
      const Icon(Icons.ramen_dining,size:30),
      const Icon(Icons.groups,size:30),
    ];
    screens[index];


    return CurvedNavigationBar(
      key: navigationKey,
      backgroundColor: Colors.transparent,
      items: items,
      height: 50,
      index: index,
      onTap: (index)=> setState(() => this.index = index ),
    );
  }
}
