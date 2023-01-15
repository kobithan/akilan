import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/screens/report_page_screen.dart';
import 'package:shape_shifter_fitness_application/screens/workout_home_screen.dart';
import 'package:shape_shifter_fitness_application/social_feed_page.dart';

import 'diet_page_screen.dart';
import 'home_screen.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  static const routeName = "/NavScreen";

  @override
  _NavScreenState createState() => _NavScreenState();
}


class _NavScreenState extends State<NavScreen> {

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    const ReportPage(),
    const WorkoutHomeScreen(),
    const HomeScreenPage(),
    const DietPage(),
    const SocialPage(),
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

    return Scaffold(
        body: screens[index],

        bottomNavigationBar: CurvedNavigationBar(
          key: navigationKey,
          backgroundColor: Colors.transparent,
          items: items,
          height: 60,
          index: index,
          onTap: (index)=> setState(() => this.index =index),
        ),
      );
  }
}
